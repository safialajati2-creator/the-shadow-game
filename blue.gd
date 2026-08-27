extends CharacterBody2D

@export var speed: float = 75.0
@export var gravity: float = 900.0
@export var max_health: int = 15

@export var attack_1_damage: int = 1
@export var attack_2_damage: int = 2
@export var attack_cooldown: float = 0.5
@export var attack_hit_time: float = 0.35
@export var attack_distance: float = 70.0
@export var after_hit_delay: float = 0.35

@export var dash_speed: float = 430.0
@export var dash_duration: float = 0.22
@export var dash_cooldown: float = 1.0
@export var dash_distance: float = 180.0

@export var freeze_time: float = 1.0

var health: int = 15
var direction: int = 1

var is_dead: bool = false
var is_attacking: bool = false
var is_dashing: bool = false
var is_taking_hit: bool = false
var intro_shown: bool = false
var can_attack: bool = true
var can_dash: bool = true

var target_player: Node2D = null
var attack_area_default_x: float = 0.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var detection_area: Area2D = $DetectionArea
@onready var attack_area: Area2D = $AttackArea
@onready var attack_shape: CollisionShape2D = $AttackArea/CollisionShape2D
@onready var hitbox: Area2D = $Hitbox

@onready var teleport_points: Node2D = get_tree().current_scene.get_node_or_null("BlueTeleportPoints")
@onready var boss_ui: Node = get_tree().current_scene.get_node_or_null("CanvasLayer/BossUI")
@onready var boss_intro: Node = get_tree().current_scene.get_node_or_null("CanvasLayer/BossIntro")
@onready var final_portal: Node = get_tree().current_scene.get_node_or_null("FinalPortal")


func _ready() -> void:
	health = max_health
	attack_shape.disabled = true
	attack_area_default_x = abs(attack_area.position.x)

	detection_area.body_entered.connect(_on_detection_area_body_entered)
	detection_area.body_exited.connect(_on_detection_area_body_exited)
	animated_sprite.animation_finished.connect(_on_animation_finished)

	animated_sprite.play("idle")

	if boss_ui != null:
		boss_ui.visible = false
		if boss_ui.has_method("setup_boss"):
			boss_ui.setup_boss("BLUE", max_health)

	if final_portal != null:
		final_portal.visible = false


func _physics_process(delta: float) -> void:
	if is_dead:
		return

	if not is_on_floor():
		velocity.y += gravity * delta

	if target_player == null or not is_instance_valid(target_player):
		velocity.x = 0

		if not is_attacking and not is_dashing and not is_taking_hit:
			animated_sprite.play("idle")

		move_and_slide()
		return

	face_player()

	if is_attacking or is_dashing or is_taking_hit:
		move_and_slide()
		return

	var distance_to_player: float = abs(target_player.global_position.x - global_position.x)

	if distance_to_player > dash_distance and can_dash and can_attack:
		start_dash()
		move_and_slide()
		return

	if distance_to_player <= attack_distance:
		velocity.x = 0

		if can_attack:
			choose_attack()

		move_and_slide()
		return

	velocity.x = direction * speed
	animated_sprite.play("walk")
	move_and_slide()


func face_player() -> void:
	if target_player == null or not is_instance_valid(target_player):
		return

	if target_player.global_position.x > global_position.x:
		direction = 1
		animated_sprite.flip_h = false
	else:
		direction = -1
		animated_sprite.flip_h = true

	update_attack_area_direction()


func update_attack_area_direction() -> void:
	if direction == 1:
		attack_area.position.x = attack_area_default_x
	else:
		attack_area.position.x = -attack_area_default_x


func _on_detection_area_body_entered(body: Node) -> void:
	if is_dead:
		return

	if body.is_in_group("player") and body is Node2D:
		target_player = body
		face_player()

		if not intro_shown:
			intro_shown = true

			if boss_intro != null and boss_intro.has_method("show_intro"):
				boss_intro.show_intro()

		if boss_ui != null:
			boss_ui.visible = true
			if boss_ui.has_method("setup_boss"):
				boss_ui.setup_boss("BLUE", max_health)


func _on_detection_area_body_exited(body: Node) -> void:
	if body == target_player:
		target_player = null


func choose_attack() -> void:
	if is_dead or is_attacking or is_dashing or is_taking_hit:
		return

	var random_attack: int = randi_range(1, 2)

	if random_attack == 1:
		start_attack_1()
	else:
		start_attack_2()


func start_attack_1() -> void:
	if is_dead or is_attacking or not can_attack:
		return

	is_attacking = true
	can_attack = false
	velocity.x = 0
	animated_sprite.play("attack_1")
	do_attack_hit(attack_1_damage, false)


func start_attack_2() -> void:
	if is_dead or is_attacking or not can_attack:
		return

	is_attacking = true
	can_attack = false
	velocity.x = 0
	animated_sprite.play("attack_2")
	do_attack_hit(attack_2_damage, true)


func do_attack_hit(damage: int, freeze: bool) -> void:
	await get_tree().create_timer(attack_hit_time).timeout

	if is_dead or not is_attacking:
		return

	attack_shape.disabled = false
	await get_tree().create_timer(0.08).timeout

	var did_hit_player: bool = false

	for body in attack_area.get_overlapping_bodies():
		if body != null and body.is_in_group("player"):
			did_hit_player = true
			hit_player(body, damage, freeze)

	attack_shape.disabled = true

	if did_hit_player:
		start_after_hit_delay()


func hit_player(player: Node, damage: int, freeze: bool) -> void:
	if player.has_method("take_damage"):
		player.take_damage(damage, global_position)

	if freeze and player.has_method("freeze_player"):
		player.freeze_player(freeze_time)


func start_after_hit_delay() -> void:
	can_attack = false
	can_dash = false

	await get_tree().create_timer(after_hit_delay).timeout

	if not is_dead:
		can_attack = true
		can_dash = true


func start_dash() -> void:
	if is_dead or is_dashing or is_attacking or is_taking_hit:
		return

	if not can_attack:
		return

	is_dashing = true
	can_dash = false

	velocity.y = 0
	velocity.x = direction * dash_speed
	animated_sprite.play("dash")

	await get_tree().create_timer(dash_duration).timeout

	is_dashing = false
	velocity.x = 0

	await get_tree().create_timer(dash_cooldown).timeout

	if not is_dead:
		can_dash = true


func take_damage(amount: int = 1, hit_source_position: Vector2 = Vector2.ZERO) -> void:
	if is_dead or is_taking_hit:
		return

	health -= amount
	health = clamp(health, 0, max_health)

	print("BLUE Health: ", health)

	if boss_ui != null and boss_ui.has_method("update_boss_health"):
		boss_ui.update_boss_health(health, max_health)

	if health <= 0:
		die()
		return

	is_taking_hit = true
	is_attacking = false
	is_dashing = false
	can_attack = true
	velocity = Vector2.ZERO
	attack_shape.disabled = true

	animated_sprite.play("hit")

	await get_tree().create_timer(0.2).timeout

	teleport_away()

	is_taking_hit = false

	if not is_dead:
		animated_sprite.play("idle")


func teleport_away() -> void:
	if target_player == null or not is_instance_valid(target_player):
		return

	if teleport_points == null:
		print("BlueTeleportPoints not found")
		return

	var points: Array[Node] = teleport_points.get_children()

	if points.is_empty():
		print("No teleport points found")
		return

	var chosen_point: Marker2D = null
	var best_distance: float = 0.0

	for point in points:
		if point is Marker2D:
			var marker: Marker2D = point
			var distance: float = marker.global_position.distance_to(target_player.global_position)

			if distance > best_distance:
				best_distance = distance
				chosen_point = marker

	if chosen_point != null:
		global_position = chosen_point.global_position
		face_player()


func die() -> void:
	if is_dead:
		return

	is_dead = true
	is_attacking = false
	is_dashing = false
	is_taking_hit = false
	velocity = Vector2.ZERO

	attack_shape.disabled = true

	$CollisionShape2D.set_deferred("disabled", true)
	$DetectionArea/CollisionShape2D.set_deferred("disabled", true)
	$AttackArea/CollisionShape2D.set_deferred("disabled", true)
	$Hitbox/CollisionShape2D.set_deferred("disabled", true)

	if boss_ui != null:
		if boss_ui.has_method("hide_bar"):
			boss_ui.hide_bar()
		else:
			boss_ui.visible = false

	animated_sprite.play("death")

	await get_tree().create_timer(1.2).timeout

	if final_portal != null:
		final_portal.visible = true

	queue_free()


func _on_animation_finished() -> void:
	if is_dead:
		return

	if animated_sprite.animation == "attack_1":
		finish_attack()

	elif animated_sprite.animation == "attack_2":
		finish_attack()

	elif animated_sprite.animation == "hit":
		animated_sprite.play("idle")

	elif animated_sprite.animation == "dash":
		is_dashing = false
		animated_sprite.play("idle")


func finish_attack() -> void:
	is_attacking = false
	attack_shape.disabled = true
	animated_sprite.play("idle")
	reset_attack_cooldown()


func reset_attack_cooldown() -> void:
	await get_tree().create_timer(attack_cooldown).timeout

	if not is_dead:
		can_attack = true

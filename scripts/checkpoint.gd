extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var is_activated: bool = false

func _ready() -> void:
	animated_sprite.play("idle")
	if not body_entered.is_connected(_on_body_entered):
		body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if not body.is_in_group("player"):
		return
	if is_activated:
		return
	activate_checkpoint(body)

func activate_checkpoint(player: Node2D) -> void:
	is_activated = true
	var saved_position := global_position + Vector2(0, -20)
	if player.has_method("set_checkpoint"):
		player.set_checkpoint(saved_position)
	SaveManager.save_checkpoint(
		get_tree().current_scene.scene_file_path,
		saved_position
	)
	animated_sprite.play("move")
	print("Checkpoint activated!")

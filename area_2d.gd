extends Area2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	monitoring = true
	body_entered.connect(_on_body_entered)
	animated_sprite.play("default") 

func _on_body_entered(body: Node) -> void:
	print("Trap touched by: ", body.name)

	if body.is_in_group("player"):
		print("PLAYER HIT TRAP")

		if body.has_method("die"):
			body.die()
		elif body.has_method("respawn"):
			body.respawn()

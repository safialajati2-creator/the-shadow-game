extends Node2D

@export var ability_name: String = "special_dash"
@export var ability_cost: int = 20
@export var interact_distance: float = 70.0

@onready var interact_point: Marker2D = $InteractPoint

@onready var shop_ui: Control = $"../CanvasLayer/ShopUI"
@onready var label: Label = $"../CanvasLayer/ShopUI/Label"
@onready var buy_button: Button = $"../CanvasLayer/ShopUI/BuyButton"
@onready var close_button: Button = $"../CanvasLayer/ShopUI/CloseButton"

var game_manager: Node = null
var player: Node2D = null
var player_inside := false

func _ready() -> void:
	shop_ui.visible = false
	label.text = "SPECAIL DASH" 

	game_manager = get_tree().current_scene.get_node("GameManager")
	player = get_tree().get_first_node_in_group("player")

	buy_button.pressed.connect(_on_buy_button_pressed)
	close_button.pressed.connect(_on_close_button_pressed)

	print("SHOP READY")
	print("Player = ", player)
	print("GameManager = ", game_manager)

func _process(_delta: float) -> void:
	if player == null:
		return

	var distance = interact_point.global_position.distance_to(player.global_position)
	player_inside = distance <= interact_distance

	if Input.is_action_just_pressed("interact"):
		print("distance = ", distance, " | player_inside = ", player_inside)

	if player_inside and Input.is_action_just_pressed("interact"):
		shop_ui.visible = true
		label.text = "SPECAIL DASH" 
		print("Shop opened")

func _on_buy_button_pressed() -> void:
	if game_manager == null:
		print("GameManager not found")
		return

	var success = game_manager.buy_ability(ability_name, ability_cost)

	if success:
		label.text = "Special Dash Bought"
		print("Ability Bought")
	else:
		if game_manager.has_ability(ability_name):
			label.text = "Already bought"
			print("Already bought")
		else:
			label.text = "Not Enough Runes"
			print("Not Enough Runes")

func _on_close_button_pressed() -> void:
	shop_ui.visible = false
	print("Shop Closed")

extends Node

@onready var spawn_point: Node2D = $"../SpawnPoint"
var respawn_point: Vector2 = Vector2.ZERO

var coins: int = 0

var abilities = {
	"special_dash": false
}

func _ready() -> void:
	if spawn_point != null:
		respawn_point = spawn_point.global_position

func add_coins(amount: int) -> void:
	coins += amount
	print("Runes: ", coins)

func can_buy(cost: int) -> bool:
	return coins >= cost

func buy_ability(ability_name: String, cost: int) -> bool:
	if not can_buy(cost):
		return false
	if abilities.has(ability_name) and abilities[ability_name]:
		return false
	coins -= cost
	if abilities.has(ability_name):
		abilities[ability_name] = true
	print("Bought ability: ", ability_name)
	print("Remaining runes: ", coins)
	return true

func has_ability(ability_name: String) -> bool:
	if abilities.has(ability_name):
		return abilities[ability_name]
	return false

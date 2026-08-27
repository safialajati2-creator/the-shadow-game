extends Node

const SAVE_PATH := "user://save_game.cfg"

var current_scene_path: String = ""
var checkpoint_position: Vector2 = Vector2.ZERO
var has_checkpoint: bool = false
var is_continuing: bool = false

func save_checkpoint(scene_path: String, position: Vector2) -> void:
	current_scene_path = scene_path
	checkpoint_position = position
	has_checkpoint = true
	var config := ConfigFile.new()
	config.set_value("progress", "scene_path", current_scene_path)
	config.set_value("progress", "checkpoint_position", checkpoint_position)
	config.set_value("progress", "has_checkpoint", has_checkpoint)
	config.save(SAVE_PATH)

func load_save() -> bool:
	var config := ConfigFile.new()
	var err := config.load(SAVE_PATH)
	if err != OK:
		return false
	current_scene_path = config.get_value("progress", "scene_path", "")
	checkpoint_position = config.get_value("progress", "checkpoint_position", Vector2.ZERO)
	has_checkpoint = config.get_value("progress", "has_checkpoint", false)
	return current_scene_path != ""

func has_save() -> bool:
	return FileAccess.file_exists(SAVE_PATH)

func clear_save() -> void:
	current_scene_path = ""
	checkpoint_position = Vector2.ZERO
	has_checkpoint = false
	is_continuing = false

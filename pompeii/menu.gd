extends Node2D

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func quit() -> void:
	get_tree().quit()

func start() -> void:
	get_tree().change_scene_to_file("res://catscene.tscn")

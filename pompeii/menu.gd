extends Node2D


func quit() -> void:
	get_tree().quit()


func start() -> void:
	get_tree().change_scene_to_file("res://catscene.tscn")

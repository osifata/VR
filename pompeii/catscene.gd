extends Node3D

@onready var move = $AnimationPlayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$AnimationPlayer2.play("move")
	await move.animation_finished
	get_tree().call_deferred("change_scene_to_file", "res://world.tscn")

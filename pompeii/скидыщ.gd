extends Node3D

@onready var spircle: GPUParticles3D = $"Искры"
@onready var smoke: GPUParticles3D = $"дым"
@onready var fire: GPUParticles3D = $"огонь"
@onready var audio_stream_player_3d: AudioStreamPlayer3D = $AudioStreamPlayer3D

func explode():
	spircle.emitting = true
	smoke.emitting = true
	fire.emitting = true
	audio_stream_player_3d.play()
	await get_tree().create_timer(2.0).timeout
	queue_free()

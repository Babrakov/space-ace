extends Node2D

func _ready() -> void:
	pass

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()

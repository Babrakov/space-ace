extends Node2D

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("test"):
		SignalHub.emit_on_create_bullet(
			Vector2(300,300),
			Vector2(1,-1),
			100.0,
			BulletBase.BulletType.Bomb
		)

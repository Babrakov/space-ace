extends Node2D


const ADD_OBJECT: String = "add_object"
const EXPLOSION = preload("res://Scenes/Explosion/Explosion.tscn")
const POWER_UP = preload("res://Scenes/PowerUp/PowerUp.tscn")

func on_create_powerup(pos: Vector2, pu_type: PowerUp.PowerUpType) -> void:
	var pu: PowerUp = POWER_UP.instantiate()
	pu.power_up_type = pu_type
	call_deferred(ADD_OBJECT, pu, pos)

func on_create_powerup_random(pos: Vector2) -> void:
	var rpu= PowerUp.PowerUpType.values().pick_random()
	on_create_powerup(pos, rpu)


	SignalHub.on_create_powerup.connect(on_create_powerup)
	SignalHub.on_create_powerup_random.connect(on_create_powerup_random)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_create_explosion.connect(on_create_explosion)
	SignalHub.on_create_powerup.connect(on_create_powerup)
	SignalHub.on_create_powerup_random.connect(on_create_powerup_random)

func on_create_explosion(pos: Vector2, anim_name: String ) -> void:
	var scene: Explosion = EXPLOSION.instantiate()
	scene.setup(anim_name)
	call_deferred(ADD_OBJECT, scene, pos)


func add_object(obj: Node, pos: Vector2) -> void:
	add_child(obj)
	obj.global_position = pos

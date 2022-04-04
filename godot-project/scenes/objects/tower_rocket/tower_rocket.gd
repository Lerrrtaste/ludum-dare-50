extends "res://scenes/objects/tower_base/tower_base.gd"

onready var TOWER_ID = GameData._tower_ids.ROCKET

func _ready():
	._ready()
	.load_tower(TOWER_ID)

func shoot():
	var inst = ProjectileClass.instance()

	game.add_child(inst)
	inst.position = global_position
	var direction = target.position - global_position
	direction += (target.speed*target.direction.normalized()) # add expected movement until impact
	inst.start_direction(direction, 3, false)
	$SprTarget.global_position = global_position+direction


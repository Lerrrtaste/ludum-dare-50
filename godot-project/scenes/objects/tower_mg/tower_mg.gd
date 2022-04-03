extends "res://scenes/objects/tower_base/tower_base.gd"

onready var TOWER_ID = GameData._tower_ids.MG
onready var game = get_tree().get_nodes_in_group("game")[0]

func _ready():
	._ready()
	.load_tower(TOWER_ID)

func shoot():
	var inst = ProjectileClass.instance()
	add_child(inst)
	inst.position = position
	inst.start_direction(target.position - position, 1, false)
	

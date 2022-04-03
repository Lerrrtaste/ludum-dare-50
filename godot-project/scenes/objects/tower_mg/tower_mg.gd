extends "res://scenes/objects/tower_base/tower_base.gd"

var ProjectileClass = preload("res://scenes/objects/projectile/Projectile.tscn")

onready var TOWER_ID = GameData._tower_ids.MG
onready var game = get_tree().get_nodes_in_group("game")[0]

func _ready():
	._ready()
	.load_tower(TOWER_ID)

func shoot():
	var inst = ProjectileClass.instance()
	
	game.add_child(inst)
	inst.position = global_position
	var direction = target.position - global_position
	direction += (target.speed*target.direction.normalized())*.5 # add expected movement until impact
	inst.start_direction(direction, 1, false)
	

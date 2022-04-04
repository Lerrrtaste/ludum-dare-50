extends "res://scenes/objects/tower_base/tower_base.gd"

onready var TOWER_ID = GameData._tower_ids.FLAK
onready var Projectile =  load(GameData.get_projectile_property(GameData._projectile_ids.FLAK, "scene_path"))

func _ready():
	._ready()
	.load_tower(TOWER_ID)

func shoot():
	var inst = GameData.get_projectile_property(GameData._projectile_ids.FLAK, "scene_path").instance()
	game.add_child(inst)
	inst.position = global_position
	var direction = target.position - global_position
	direction += (target.speed*target.direction.normalized())*2 # add expected movement until impact
	inst.start(direction, false)
	$SprTarget.global_position = global_position+direction

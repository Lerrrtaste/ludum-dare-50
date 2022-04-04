extends "res://scenes/objects/tower_base/tower_base.gd"

onready var Projectile = load(GameData.get_projectile_property(GameData._projectile_ids.LASER, "scene_path"))
onready var TOWER_ID = GameData._tower_ids.LASER

func _ready():
	._ready()
	.load_tower(TOWER_ID)

func shoot():
	var inst = Projectile.instance()
	game.add_child(inst)
	inst.position = global_position
	var direction = target.position - global_position
	direction += (target.speed*target.direction.normalized())*.1 # add expected movement until impact
	inst.start(direction, false)
	$SprTarget.global_position = global_position+direction

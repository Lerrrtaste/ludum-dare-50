extends "res://scenes/objects/tower_base/tower_base.gd"

onready var TOWER_ID = GameData._tower_ids.MG
onready var Projectile =  load(GameData.get_projectile_property(GameData._projectile_ids.MG, "scene_path"))
onready var audio_player=$AudioShoot

func _ready():
	._ready()
	.load_tower(TOWER_ID)

func shoot():
	audio_player.play()
	var inst = Projectile.instance()
	game.add_child(inst)
	inst.position = global_position
	
	var direction = target.position - global_position
	direction += (target.speed*target.direction.normalized())*.7 # add expected movement until impact
	
	inst.start(direction, false)
	
	$SprTarget.global_position = global_position+direction

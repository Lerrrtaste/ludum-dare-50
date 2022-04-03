extends "res://scenes/objects/tower_base/tower_base.gd"

onready var TOWER_ID = GameData._tower_ids.MG

func _ready():
	._ready()
	.load_tower(TOWER_ID)

func shoot():
	print("mg shooting")

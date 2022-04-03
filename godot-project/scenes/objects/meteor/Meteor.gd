extends Node2D

var planet
var target
var speed = GameData.get_enemy_property(GameData._enemy_ids.METEOR1, "speed")
var direction = Vector2(randi()%(speed*4), randi()%(speed*4)) #random start speed

func _ready():
	planet=get_tree().get_nodes_in_group("planet")[0]
	target=planet.position
	 # Replace with function body.

func _process(delta):
	#move to the target
	direction=(direction+(target-position)).normalized()
	position=(position+(direction*speed*delta))
	pass

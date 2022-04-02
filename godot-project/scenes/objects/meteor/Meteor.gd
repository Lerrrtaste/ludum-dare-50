extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var planet
var target
var speed = GameData.get_enemy_property(GameData._enemy_id.METEOR1, "speed")
var direction = Vector2(randi()%(speed*4), randi()%(speed*4)) #random start speed

# Called when the node enters the scene tree for the first time.
func _ready():
	planet=get_tree().get_nodes_in_group("planet")[0]
	target=planet.position
	 # Replace with function body.

func _process(delta):
	#move to the target
	direction=(direction+(target-position)).normalized()
	position=(position+(direction*speed*delta))
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

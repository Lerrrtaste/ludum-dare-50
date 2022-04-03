extends "res://scenes/objects/base_enemy/BaseEnemy.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _process(delta):
	var distance=(1/(target-position).length())*32
	direction=(direction*100+(target-position).normalized()*distance).normalized()
	position=(position+(direction*speed*delta))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

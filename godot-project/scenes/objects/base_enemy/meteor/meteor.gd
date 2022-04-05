extends "res://scenes/objects/base_enemy/BaseEnemy.gd"
onready var area=$Area2D


var non_sef_collision_counter=1

func _process(delta):
	if non_sef_collision_counter != -1:
		non_sef_collision_counter-=delta
		if non_sef_collision_counter<=0: #counter run out
			non_sef_collision_counter=-1 #set to not count and set again
			area.set_collision_mask_bit(2,true) # check again on layer 3 for other objects
	var distance=(1/(target-position).length())*32
	direction=(direction*50+(target-position).normalized()*distance).normalized()
	position=(position+(direction*speed*delta))

	pass

func disable_self_collision(seconds:int):
	non_sef_collision_counter=seconds
	area.set_collision_mask_bit(2,false) #dont check layer 3 for other objects

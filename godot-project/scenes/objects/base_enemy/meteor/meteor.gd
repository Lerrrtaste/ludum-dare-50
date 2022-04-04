extends "res://scenes/objects/base_enemy/BaseEnemy.gd"

func _process(delta):
	var distance=(1/(target-position).length())*32
	direction=(direction*50+(target-position).normalized()*distance).normalized()
	position=(position+(direction*speed*delta))
	
	speed += speed * .2 * delta
	

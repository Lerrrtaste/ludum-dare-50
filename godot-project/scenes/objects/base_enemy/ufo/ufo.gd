extends "res://scenes/objects/base_enemy/BaseEnemy.gd"

onready var game=get_tree().get_nodes_in_group("game")[0]
const min_planet_dist = 100
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter=0
var pos_old=Vector2(0,0)

# Called when the node enters the scene tree for the first time.
func _process(delta):
	var distance=int((target-position).length())
	if distance > min_planet_dist:
		position=(position+((target-position).normalized()*speed*delta)) #head towards planet
	if distance < min_planet_dist:
		position=(position+((position-target).normalized()*speed*delta)) #head away from planet
	if distance == min_planet_dist:
		position=target+(position-target).rotated(speed*delta*0.01) #rotate in aan orbit at min_planet_dist
	#set direction to predict movement (needed for aimin of the turrets)
	direction=position-pos_old
	pos_old=position
	#shoot at projectile
	counter = counter + delta
	if counter > 4:
		var ProjectileScene = load("res://scenes/objects/projectile/Projectile.tscn")
		var projectile=ProjectileScene.instance()
		game.add_child(projectile)
		projectile.position=position
		projectile.start_direction(target-position,1,true)
		counter=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

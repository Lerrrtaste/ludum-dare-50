extends "res://scenes/objects/base_enemy/BaseEnemy.gd"

onready var game=get_tree().get_nodes_in_group("game")[0]
const min_planet_dist = 60
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var counter=0
var pos_old=Vector2(0,0)
var target_planet_dist=min_planet_dist+(randi()%60)

func _ready():
	direction= Vector2(randi(), randi()).normalized() #random start speed
	planet=get_tree().get_nodes_in_group("planet")[0]
	target=planet.position
	hp_max = hp
	#add the shield
	add_child(load("res://scenes/objects/base_enemy/shield.tscn").instance())

# Called when the node enters the scene tree for the first time.
func _process(delta):
	var distance=int((planet.position-position).length())
	#roatate in a orbit
	if distance > target_planet_dist:
		position=(position+((planet.position-position).normalized()*speed*delta)) #head towards planet
	if distance < target_planet_dist:
		position=(position+((position-planet.position).normalized()*speed*delta)) #head away from planet
	if distance == target_planet_dist:
		position=planet.position+(position-planet.position).rotated(speed*delta*0.01) #rotate in aan orbit at min_planet_dist
	#set direction to predict movement (needed for aimin of the turrets)
	direction=position-pos_old
	pos_old=position
	# set nearest target
	.set_target_to_nearest()
	#shoot at projectile
	counter = counter + delta
	if counter > fire_rate:
		var ProjectileScene = load("res://scenes/objects/BaseProjectile/mg/mg.tscn")
		var projectile=ProjectileScene.instance()
		game.add_child(projectile)
		projectile.position=position
		projectile.start(target-position,true)
		counter=0
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

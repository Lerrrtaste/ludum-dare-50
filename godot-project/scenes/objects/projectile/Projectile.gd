extends Node2D
var direction
var damage	#damage the projectile draws
var speed	#speed of then rpjectile
var target	#target parameter only needed for homing projectiles

onready var sprite=$Sprite
onready var area=$Area2D

func start_homing(ptarget): #start and initialize the homing projectile
			sprite.texture = load("res://scenes/objects/projectile/projectile-homing.png")
			target=ptarget
			damage=10
			speed=100
			set_process(true)

func start_direction(pdirection:Vector2, projectile_type:int, fired_by_enemy:bool):
	if fired_by_enemy :
		area.set_collision_mask_bit(2,false)
		area.set_collision_mask_bit(0,true)
		area.set_collision_mask_bit(1,true)
	else:
		area.set_collision_mask_bit(2,true)
		area.set_collision_mask_bit(0,false)
		area.set_collision_mask_bit(1,false)
	match (projectile_type):
		1:	#the machine gun projectile
			sprite.texture = load("res://scenes/objects/projectile/projectile-mg.png")
			direction=pdirection.normalized()
			damage=10
			speed=100
			set_process(true)
		2:	#the flak (anti air) projectile
			sprite.texture = load("res://scenes/objects/projectile/projectile-flag.png")
			direction=pdirection.normalized()
			damage=50
			speed=15
			set_process(true)
		3:	#the rocket launcher projectile (non homing)
			sprite.texture = load("res://scenes/objects/projectile/projectile-rocket.png")
			direction=pdirection.normalized()
			damage=100
			speed=100
			set_process(true)
		_:
				print("projectile type does not exist")
	pass
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.

func _process(delta):
	if target:
		direction=(target.position-position).normalized+direction*3
	position=(position+(direction*speed*delta))
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if area.get_parent().has_method("receive_damage"):
		area.get_parent().receive_damage(damage)
		queue_free()
	pass # Replace with function body.

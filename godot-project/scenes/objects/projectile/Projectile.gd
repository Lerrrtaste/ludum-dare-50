extends Node2D
var direction
var damage	#damage the projectile draws
var speed	#speed of then rpjectile
var target	#target parameter only needed for homing projectiles


func start_homing(ptarget): #start and initialize the homing projectile
			Sprite.texture = load("res://scenes/objects/projectile/projectile-homing.png")
			target=ptarget
			damage=10
			speed=100
			set_process(true)

func start(pdirection:Vector2, projectile_type:int ):
	match (projectile_type):
		1:	#the machine gun projectile
			Sprite.texture = load("res://scenes/objects/projectile/projectile-mg.png")
			direction=pdirection.normalized()
			damage=10
			speed=100
			set_process(true)
		2:	#the flak (anti air) projectile
			Sprite.texture = load("res://scenes/objects/projectile/projectile-flag.png")
			direction=pdirection.normalized()
			damage=50
			speed=15
			set_process(true)
		3:	#the rocket launcher projectile (non homing)
			Sprite.texture = load("res://scenes/objects/projectile/projectile-rocket.png")
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

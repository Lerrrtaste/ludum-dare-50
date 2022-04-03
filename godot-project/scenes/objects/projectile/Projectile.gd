extends Node2D
var direction
var damage
var speed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func start(pdirection:Vector2, projectile_type:int ):
	match (projectile_type):
		1:
			Sprite.texture = load("res://scenes/objects/projectile/projectile.png")
			direction=pdirection.normalized()
			damage=10
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

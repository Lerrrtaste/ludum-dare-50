extends Node2D

var impact_part = preload("res://helpers/particles/ImpactParticle.tscn") 

var direction=Vector2(0,0)
var damage	#damage the projectile draws
var speed	#speed of then rpjectile
var target	#target parameter only needed for homing projectiles
var projectile_type=0
var counter=0
var fired_by_enemy=false
onready var sprite=$Sprite
onready var area=$Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(false)
	pass # Replace with function body.

func _process(delta):
	position=(position+(direction*speed*delta))
	#autodestroy after 10 sec
	counter = counter+delta
	if counter>10.0:
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func fetch_data_from_dic(id_in_dict):
	damage=GameData.get_projectile_property(id_in_dict, "damage")
	speed=GameData.get_projectile_property(id_in_dict, "speed")
	if fired_by_enemy :
		area.set_collision_mask_bit(2,false)
		area.set_collision_mask_bit(0,true)
		area.set_collision_mask_bit(1,true)
	else:
		area.set_collision_mask_bit(2,true)
		area.set_collision_mask_bit(0,false)
		area.set_collision_mask_bit(1,false)

func _on_Area2D_area_entered(area):
		if area.has_method("receive_damage"): #if it is a shiled
			area.receive_damage(damage)
			var inst = impact_part.instance()
			get_parent().add_child(inst)
			inst.global_position = global_position
			
			queue_free()
		else:
			if area.get_parent().has_method("receive_damage"): #normal entity
				area.get_parent().receive_damage(damage)
				var inst = impact_part.instance()
				get_parent().add_child(inst)
				inst.global_position = global_position
				queue_free()

extends "res://scenes/objects/BaseProjectile/BaseProjectile.gd"
var id_in_dict=GameData._projectile_ids.LASER

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func start(pdirection, pfired_by_enemy:bool):
	fired_by_enemy=pfired_by_enemy
	direction=pdirection.normalized()
	.fetch_data_from_dic(id_in_dict)
	var randint=(randi()%5)+1
	SoundPlayer.play("Laser %s.wav"%randint)
	set_process(true)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Area2D_area_entered(area):
		if area.has_method("receive_damage"): #if it is a shiled
			area.receive_damage(damage*3)
			queue_free()
		else:
			if area.get_parent().has_method("receive_damage"): #normal entity
				area.get_parent().receive_damage(damage)
				queue_free()

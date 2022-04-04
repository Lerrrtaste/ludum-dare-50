extends "res://scenes/objects/BaseProjectile/BaseProjectile.gd"
var id_in_dict=GameData._projectile_ids.MISSILE

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func start(ptarget, pfired_by_enemy:bool):
	target=ptarget
	fired_by_enemy=pfired_by_enemy
	.fetch_data_from_dic(id_in_dict)
	set_process(true)
	var randint=(randi()%2)+1
	SoundPlayer.play("Rocket Launched %s.wav"%randint)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _process(delta):
	speed=speed+speed*delta
	if is_instance_valid(target):
		direction=(target.global_position-position).normalized()
	position=(position+(direction*speed*delta))
	#autodestroy after 10 sec
	counter = counter+delta
	if counter>25.0:
		queue_free()

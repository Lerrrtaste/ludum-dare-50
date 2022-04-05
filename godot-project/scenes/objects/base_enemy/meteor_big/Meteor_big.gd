extends "res://scenes/objects/base_enemy/BaseEnemy.gd"
onready var area=$Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

func _process(delta):
	var distance=(1/(target-position).length())*32
	direction=(direction*100+(target-position).normalized()*distance).normalized()
	rotation = direction.angle() + deg2rad(45)
	position=(position+(direction*speed*delta))
	pass

func die():
	area.set_collision_mask_bit(2,false) #i am dieing so no longer collide with other objects
	#spwan three small meterors
	var enemy_id=GameData._enemy_ids.METEOR
	var enemy_count=3
	var enemy_scene_path=GameData.get_enemy_property(enemy_id, "scene_path")
	var enemy_hp=GameData.get_enemy_property(enemy_id, "hp")
	var enemy_damage_amount=GameData.get_enemy_property(enemy_id, "damage_amount")
	var enemy_speed= GameData.get_enemy_property(enemy_id, "speed")
	var enemy_fire_rate= GameData.get_enemy_property(enemy_id, "fire_rate")
	var EnemyScene = load(enemy_scene_path)
	#spwn mini meteros
	for i in range(enemy_count) :
		var enemy=EnemyScene.instance()
		enemy.global_position=global_position
		enemy.hp=enemy_hp
		enemy.damage=enemy_damage_amount
		enemy.speed=enemy_speed*3 #make two times faster than default
		enemy.fire_rate=enemy_fire_rate
		print(enemy_id,  " spawned")
		var game = get_tree().get_nodes_in_group("game")[0]
		game.add_child(enemy)
		enemy.disable_self_collision(4) # make invincible for 4 sec
	#die
	emit_signal("died")
	visible=false
	set_process(false)
	queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

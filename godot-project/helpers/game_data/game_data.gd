extends Node

var EnemieData = preload("res://helpers/game_data/enemy_data.gd")
var TowerData = preload("res://helpers/game_data/tower_data.gd")
var WaveData = preload("res://helpers/game_data/wave_data.gd")


func get_enemy_dict(enemy_id) -> Dictionary:
if
	return _ENEMY_DATA[enemy_id]


func get_enemy_property(enemy_id, property_name) -> Variant:
	if property_name in _ENEMY_DATA[enemy_id]:
		return _ENEMY_DATA[enemy_id][property_name]
	else:
		return _ENEMY_DATA[Enemies.DEFAULT][property_name]

	return _ENEMY_DATA[enemy_id][property_name]

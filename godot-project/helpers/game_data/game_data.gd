extends Node

var EnemyScene = load("res://helpers/game_data/enemy_data.gd")
var _enemy_data
var _enemy_ids

var TowerScene = load("res://helpers/game_data/tower_data.gd")
var _tower_data
var _tower_ids

var WaveScene = load("res://helpers/game_data/wave_data.gd")
var _wave_data
var _wave_ids

func _ready():
	var Enemies = EnemyScene.new()
	_enemy_ids = Enemies.Enemies
	_enemy_data = Enemies._ENEMY_DATA

	var Towers = TowerScene.new()
	_tower_ids = Towers.Towers
	_tower_data = Towers._TOWER_DATA
	
	var Waves = WaveScene.new()
	_wave_ids = Waves._WAVE_DATA.keys()
	_wave_data = Waves._WAVE_DATA


#### Getters

# Enemy Data

func get_enemy_dict(enemy_id) -> Dictionary:
	return _get_dict(_enemy_data, enemy_id)

func get_enemy_property(enemy_id, property_name):
	return _get_property(_enemy_data, enemy_id, property_name)


# Tower Data

func get_tower_dict(tower_id) -> Dictionary:
	return _get_dict(_tower_data, tower_id)

func get_tower_property(tower_id, property_name):
	return _get_property(_tower_data, tower_id, property_name)


# wave Data

func get_wave_dict(wave_number) -> Dictionary:
	return _get_dict(_wave_data, wave_number)

func get_wave_property(wave_number, property_name):
	return _get_property(_wave_data, wave_number, property_name)


#### Internal
func _get_dict(data_dict, key) -> Dictionary:
	if not key in data_dict:
		Notifier.notify_debug("Key does not exist!!", key)
		return data_dict[-1]

	return data_dict[key]

func _get_property(data_dict, key, property):
	if not key in data_dict:
		Notifier.notify_debug("Key does not exist!!", key)
		assert(false)
		
	if not property in data_dict[key]:
		Notifier.notify_debug("Property does not exist", key)
		return data_dict[-1][property]

	return data_dict[key][property]

extends CanvasLayer

signal wave_changed

var money = 0

var wave = 1  # aka year
var wave_progress = 0  #progress 0.0 - 1.0
var current_wave_data 
var events

onready var planet = $Planet

func _ready():
	start_wave(wave)
	emit_signal("wave_changed", wave) # emits a signal that the first wave/age/lavel started
	get_node("Planet").connect("died", self, "_on_game_over")
	
func perform_spawn(event):
	var enemy_id=event["id"]
	var enemy_count=event["count"]
	print(enemy_id," spawned")
	var enemy_scene_path=GameData.get_enemy_property(enemy_id, "scene_path")
	var EnemyScene =load(enemy_scene_path)
	for i in range(enemy_count) :
		var enemy=EnemyScene.instance()
		add_child(enemy)
		enemy.position=rand_pos_to_spwan()
	pass
	
func rand_pos_to_spwan()->Vector2:
	var side_x = randi() %2 # create bolean to decide on wich side to spawn
	var side_y = randi() %2
	var value_x=randi()%100 #randon number for the distance from the window border
	var value_y=randi()%100
	var x
	var y
	#calculate x coordinate
	if side_x >= 0:
		x=value_x*-1
	else:
		x=value_x+get_viewport().size.x
	#calculate y coordinate
	if side_y >= 0:
		x=value_y*-1
	else:
		y=value_y+get_viewport().size.y
	var vec := Vector2(x,y)
	return vec
	
func display_age_progress(wave, timestamp):
	#todo - implement age/level progress bar 
	# wave specifies the age/level as integer
	#timestamp is a float from 0.0 (age just started) to 1.0 (age is over)
	pass
	
func _process(delta):
	wave_progress += delta/current_wave_data["duration"]
	#print(wave_progress)
	if wave_progress >= 1.0 :
		wave = wave + 1
		start_wave(wave)
		emit_signal("wave_changed", wave) #emit a signal that the wave/age/level has been changed
		print("new wave/age entered")
	display_age_progress(wave,wave_progress)
	if ! events.empty() :
		var timestamp=events[0]["timestamp"]
		if timestamp<wave_progress :
			#print(timestamp,wave_progress)
			perform_spawn(events.pop_front())
			
	


func start_wave(wave_number):
	if wave_number in GameData._wave_data:
		current_wave_data = GameData.get_wave_dict(wave_number)
	events = current_wave_data["enemies"]

<<<<<<< HEAD
func _on_game_over():
	#show game_over room
	get_tree().change_scene("res://scenes/rooms/game_over/GameOver.tscn")
	pass
=======


#### Shop

func _on_BtnShop_pressed():
	$ContainerShop.visible = true
>>>>>>> fb3be78 (Worked on Shop, Added Game UI; Changed GameData; Added HP Bar; Added Placeholder Tower,)

extends CanvasLayer

signal wave_changed

var money = 0

var wave = 1  # aka year
var wave_progress = 0  #progress 0.0 - 1.0
var current_wave_data 
var events:Array

onready var planet = $Planet

func _ready():
	# planet to center
	planet.position = get_viewport().size / 2
	
	#start waves
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
		enemy.position=rand_pos_to_spwan()
		add_child(enemy)
		print(rand_pos_to_spwan())
	pass
	
func rand_pos_to_spwan()->Vector2:
	var dist_from_border=50;
	var side_x = randi() %2 # create bolean to decide on wich side to spawn
	var side_y = randi() %2
	var valid_x 
	var valid_y
	#random x and y value that might be but doesnt have to be out of screen
	var rand_x=(randi()%int(get_viewport().size.x+dist_from_border*2))-dist_from_border
	var rand_y=(randi()%int(get_viewport().size.y+dist_from_border*2))-dist_from_border
	var x
	var y
	#calculate x and y coordinates that are out of the screen
	if side_x > 0:
		valid_x=dist_from_border*-1
	else:
		valid_x=dist_from_border+get_viewport().size.x
	#calculate y coordinate
	if side_y > 0:
		valid_y=dist_from_border*-1
	else:
		valid_y=dist_from_border+get_viewport().size.y
	#combine a x or x value that might be in the screen to one wchich is definately out of the screen
	var top_or_side=randi()%2
	if top_or_side:
		y=valid_y
		x=rand_x
	else:
		y=rand_y
		x=valid_x
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
		wave_progress=0.0
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
	for k in current_wave_data["enemies"] :
		events.append(k)

func _on_game_over():
	#show game_over room
	Notifier.notify_debug("Game Over")
	get_tree().change_scene("res://scenes/rooms/game_over/GameOver.tscn")


#### Shop

func _on_BtnShop_pressed():
	$ContainerShop.visible = true


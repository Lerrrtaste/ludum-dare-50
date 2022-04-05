extends CanvasLayer

signal wave_changed

var ShopItem = preload("res://ui/shop/shop_item/ShopItem.tscn")
var PopUp = preload("res://helpers/popup/Popup.tscn") 

var money = 1000

var wave = 1  # aka year
var wave_progress = 0  #progress 0.0 - 1.0
var current_wave_data 
var events:Array

onready var planet = $Planet
onready var lbl_resources = $ContainerStats/VBoxContainer/LblResources
onready var lbl_planet_hp = $ContainerStats/VBoxContainer/LblPlanetHP
onready var lbl_wave = $ContainerStats/VBoxContainer/LblWave
onready var lbl_wave_progress = $ContainerWave/VBoxContainer/LblWaveProgress
onready var lbl_wave_next = $ContainerWave/VBoxContainer/LblWaveNext
var WarningMarkerClass = preload("res://ui/warning_mark/WarningMarker.tscn")

func _ready():
	# signals
	get_node("Planet").connect("died", self, "_on_game_over")
	
	# planet to center
	planet.position = get_viewport().size / 2
	
	#start waves
	start_wave(wave)


func _process(delta):
	progress_wave(delta)
	update_ui()
	_process_shake(transform.origin, 0.0, delta)
	


#### waves
func start_wave(wave_number):

	emit_signal("wave_changed", wave) # emits a signal that the first wave/age/lavel started
	if wave_number in GameData._wave_data:
		current_wave_data = GameData.get_wave_dict(wave_number)
	for k in current_wave_data["enemies"] :
		events.append(k)
	

	
func progress_wave(delta):
	wave_progress += delta/current_wave_data["duration"]
	
	if wave_progress >= 1.0 :
		wave = wave + 1
		start_wave(wave)
		wave_progress=0.0
		#emit_signal("wave_changed", wave) #emit a signal that the wave/age/level has been changed
		print("new wave/age entered")
	
	if ! events.empty() :
		var timestamp=events[0]["timestamp"]
		if timestamp<wave_progress:
			perform_spawn(events.pop_front())

func _show_popup(text:String,from:Vector2)->void:
	var inst = PopUp.instance()
	add_child(inst)
	inst.start(text,from,from)

	
func perform_spawn(event):
	var enemy_id=event["id"]
	var enemy_count=event["count"]
	var enemy_scene_path=GameData.get_enemy_property(enemy_id, "scene_path")
	var enemy_hp=GameData.get_enemy_property(enemy_id, "hp")
	var enemy_damage_amount=GameData.get_enemy_property(enemy_id, "damage_amount")
	var enemy_speed= GameData.get_enemy_property(enemy_id, "speed")
	var enemy_fire_rate= GameData.get_enemy_property(enemy_id, "fire_rate")
	var EnemyScene = load(enemy_scene_path)
	
	for i in range(enemy_count) :
		var enemy=EnemyScene.instance()
		var e_pos = rand_pos_to_spawn()
		
		var inst = WarningMarkerClass.instance()
		var warn_pos = e_pos
		add_child(inst)
		warn_pos.x = clamp(warn_pos.x, inst.texture.get_width(), get_viewport().get_visible_rect().size.x-inst.texture.get_width())
		warn_pos.y = clamp(warn_pos.y, inst.texture.get_height(), get_viewport().get_visible_rect().size.y-inst.texture.get_height())
		inst.position = warn_pos
		
		enemy.position=e_pos
		enemy.hp=enemy_hp
		enemy.damage=enemy_damage_amount
		enemy.speed=enemy_speed
		enemy.fire_rate=enemy_fire_rate
		print(enemy_id,  " spawned")
		add_child(enemy)
	
	
func rand_pos_to_spawn()->Vector2:
	var dist_from_border=100;
	var side_x = randi() %2 # create bolean to decide on wich side to spawn
	var side_y = randi() %2
	var valid_x 
	var valid_y
	
	#random x and y value that might be but doesnt have to be out of screen
	var rand_x=(randi()%int(get_viewport().size.x))
	var rand_y=(randi()%int(get_viewport().size.y))
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
	
	return Vector2(x,y)
	
func _on_game_over():
	#show game_over room
	Notifier.notify_debug("Game Over")
	get_tree().change_scene("res://scenes/rooms/game_over/GameOver.tscn")


#### UI

func update_ui():
	lbl_planet_hp.text = "Planet HP: " + str(planet.hp)
	lbl_resources.text = "Money: " + str(money)
	lbl_wave.text = "Wave: " + str(wave)
	lbl_wave_progress.text = "Wave Progress: " + str(floor(wave_progress*100)) + "%"
	lbl_wave_next.text = "Next Wave in: " + str(floor(current_wave_data["duration"] * (1-wave_progress))) + "s"


#### Callbacks

func _on_BtnShop_pressed():
	for i in get_tree().get_nodes_in_group("preview"):
		i.queue_free()
		i.set_process(false)
		i.set_visible(false)
	
	$ContainerShop.visible = true
	$BtnShop.visible = false


func _on_ContainerShop_hide():
	$BtnShop.visible = true


func _on_AudioIntro_finished():
	$AudioLoop.play()


##### screenshake



export var max_offset : float = 5.0
export var max_roll : float = 5.0
export var shakeReduction : float = 2.5

var stress : float = 0.0
var shake : float = 0.0


func _process_shake(center, angle, delta) -> void:
	shake = stress * stress

	rotation_degrees = angle + (max_roll * shake *  _get_noise(randi(), delta))
	
	var offset = Vector2()
	offset.x = (max_offset * shake * _get_noise(randi(), delta + 1.0))
	offset.y = (max_offset * shake * _get_noise(randi(), delta + 2.0))
	
	offset.x = center.x + offset.x
	offset.y = center.y + offset.y
		
	stress -= (shakeReduction / 100.0)
	
	stress = clamp(stress, 0.0, 1.0)
	
	
func _get_noise(noise_seed, time) -> float:
	var n = OpenSimplexNoise.new()
	
	n.seed = noise_seed
	n.octaves = 4
	n.period = 20.0
	n.persistence = 0.8
	
	return n.get_noise_1d(time)
	
	
func add_stress(amount : float) -> void:
	stress += amount
	stress = clamp(stress, 0.0, 1.0)

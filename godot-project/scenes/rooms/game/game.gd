extends CanvasLayer

signal wave_changed

var wave = 1  # aka year
var wave_progress = 0  #progress 0.0 - 1.0
var current_wave_data 
var events

func _ready():
	start_wave(wave)
	emit_signal("wave_changed", wave) # emits a signal that the first wave/age/lavel started
	
func perform_spawn(event):
	var enemy_id=event["id"]
	var enemy_count=event["count"]
	Notifier.notify_debug("spawned %s" %enemy_id)
	#todo -- insert code wich actually spawns the objects here
	pass

	
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

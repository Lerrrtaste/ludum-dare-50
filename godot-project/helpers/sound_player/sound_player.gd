extends Node
var my_dict = {}

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = Directory.new()
	if dir.open("res://sound/") == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				my_dict[file_name] = (load("res://sound/%s"%file_name))
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")
	pass # Replace with function body.

func play(name:String):
	var player=AudioStreamPlayer.new()
	add_child(player)
	player.set_stream(my_dict[name])
	player.play()
	yield(get_tree().create_timer(5), "timeout")
	player.queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

extends Node2D

var _progress = 1
onready var initial_w = $Bar.region_rect.size.x


func set_progress(progress:float):
	$Bar.region_rect.size.x = progress * initial_w

extends Sprite

onready var tween = $Tween
var anim = 0

func _ready():
	_on_Tween_tween_completed(null,null)
#	var xx = abs(position.x - get_viewport_rect().size.x)
#	var x0 = position.x
#	var yy = abs(position.y - get_viewport_rect().size.y)
#	var y0 = position.y
#
#	if xx < x0:
#		rotation = deg2rad(90)
#	else:
#		rotation = deg2rad(-90)
#
#	flip_v = (yy < y0) 


func _on_Tween_tween_completed(object, key):
	match anim:
		0:
			tween.interpolate_property(self, 'modulate:a', 0, .9, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		1:
			tween.interpolate_property(self, 'modulate:a', .9, .5, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		3:
			tween.interpolate_property(self, 'modulate:a', .9, .5, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		2:
			tween.interpolate_property(self, 'modulate:a', .5, .9, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		4:
			tween.interpolate_property(self, 'modulate:a', .5, .9, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		5:
			tween.interpolate_property(self, 'modulate:a', .9, 0, 1, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
		6:
			visible=false
			queue_free()
	tween.start()
	anim += 1

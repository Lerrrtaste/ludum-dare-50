extends Sprite

onready var tween = $Tween
signal tower_preview_placed

func _ready():
	tween.interpolate_property(self, 'modulate:a', .25, .75, 0.5, tween.TRANS_SINE, tween.EASE_IN_OUT)
	tween.interpolate_property(self, 'modulate:a', .75, .25, 0.5, tween.TRANS_SINE, tween.EASE_IN_OUT)
	tween.start()

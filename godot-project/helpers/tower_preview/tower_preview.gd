extends Sprite

onready var tween = $Tween
onready var game = get_tree().get_nodes_in_group("game")[0]
onready var planet = get_tree().get_nodes_in_group("planet")[0]
var tower_id

signal tower_preview_placed

func set_tower_id(t_id):
	tower_id = t_id
	texture = load(GameData.get_tower_property(t_id, "icon_path"))
	tween.interpolate_property(self, 'modulate:a', .25, .75, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.interpolate_property(self, 'modulate:a', .75, .25, 0.5, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	visible = true

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		position = planet.get_outer_pos(event.position)
#		rotation =
	if event is InputEventMouseButton:
		if event.button_mask == BUTTON_LEFT:
			if game.money <= GameData.get_tower_property(tower_id, "cost"):
				return

			var inst = load(GameData.get_tower_property(tower_id, "scene_path")).instance()
			inst.position = planet.get_outer_pos(self.position)
			planet.add_child(inst)



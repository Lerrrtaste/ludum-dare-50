extends PanelContainer

onready var planet = get_tree().get_nodes_in_group("planet")[0]

var TowerPreview = preload("res://helpers/tower_preview/TowerPreview.tscn")

var tower_id = -1
var tower_data
var is_unlocked = false

signal tower_selected(tower_id)

func _ready():
	get_tree().get_nodes_in_group("game")[0].connect("wave_changed", self, "_on_Game_wave_changed")


func set_tower_id(p_tower_id):
	tower_id = p_tower_id

	$VBox/LblName.text = GameData.get_tower_property(tower_id, "name")
	#$VBox/TextureIcon.texture = load(GameData.get_tower_property(tower_id, "icon_path"))

	tower_data = GameData.get_tower_dict(tower_id)
	_on_Game_wave_changed(0)


func _on_Game_wave_changed(p_wave):
	is_unlocked = (p_wave >= tower_data["unlock_year"])

	if is_unlocked:
		$VBox/LblPrice.text = str(GameData.get_tower_property(tower_id, "cost")) + "energy"
		$VBox/BtnBuy.disabled = false
	else:
		$VBox/LblPrice.text = "LOCKED"



func _on_BtnBuy_pressed():
	# start tower preview
	if not is_unlocked:
		Notifier.notify_error("Not unlocked")
		return

	for i in get_tree().get_nodes_in_group("preview"):
		i.queue_free()
		i.set_process(false)
		i.set_visible(false)

	var inst = TowerPreview.instance()
	planet.add_child(inst)
	inst.set_tower_id(tower_id)
	emit_signal("tower_selected", tower_id)


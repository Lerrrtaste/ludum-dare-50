extends PanelContainer

var tower_id = -1
var tower_data
var is_unlocked = false

onready var game = get_tree().get_nodes_in_group("game")[0]

signal tower_selected(tower_id)

func set_tower_id(p_tower_id):
	tower_id = p_tower_id
	$GridContainer/LblName.text = GameData.get_tower_property(tower_id, "name")
	$GridContainer/LblPrice.text = GameData.get_tower_property(tower_id, "name")
	$GridContainer/TextureIcon.texture = load(GameData.get_tower_property(tower_id, "icon_path"))

	is_unlocked = GameData.get_tower_property(tower_id, "unlock_year")
	if is_unlocked:
		$GridContainer/LblPrice.text = "LOCKED"
	else:
		$GridContainer/LblPrice.text = "$" + str(GameData.get_tower_property(tower_id, "price"))
		$BtnBuy.disabled = false

func _on_BtnBuy_pressed():
	# start tower preview
	if not is_unlocked:
		return
	if GameData.money < GameData.get_tower_property(tower_id, "cost"):
		Notifier.notify_error("Not enough money")
		return

	emit_signal("tower_selected", tower_id)

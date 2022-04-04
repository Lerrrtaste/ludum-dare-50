extends Panel

onready var planet = get_tree().get_nodes_in_group("planet")[0]
onready var btn_buy = $BtnBuy
onready var lbl_price = $LblPrice
onready var lbl_name = $LblName

var TowerPreview = preload("res://helpers/tower_preview/TowerPreview.tscn")

var tower_id = -1
var tower_data
var is_unlocked = false

signal tower_selected(tower_id)

func _ready():
	btn_buy.disabled = true
	
func set_tower_id(p_tower_id, unlocked):
	tower_id = p_tower_id
	is_unlocked = unlocked

	lbl_name.text = GameData.get_tower_property(tower_id, "name")
	btn_buy.texture_normal = load(GameData.get_tower_property(tower_id, "icon_path"))

	tower_data = GameData.get_tower_dict(tower_id)
	
	if is_unlocked:
		lbl_price.text = str(GameData.get_tower_property(tower_id, "cost"))
		btn_buy.disabled = false
	else:
		lbl_price.text = "LOCKED"

func _on_BtnBuy_pressed():
	# start tower preview
	if not is_unlocked:
		Notifier.notify_error("Not unlocked","Available in wave %s"%tower_data.unlock_year)
		return

	for i in get_tree().get_nodes_in_group("preview"):
		i.queue_free()
		i.set_process(false)
		i.set_visible(false)

	var inst = TowerPreview.instance()
	planet.add_child(inst)
	inst.set_tower_id(tower_id)
	emit_signal("tower_selected", tower_id)


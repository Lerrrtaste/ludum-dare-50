extends Panel

onready var planet = get_tree().get_nodes_in_group("planet")[0]
onready var game = get_tree().get_nodes_in_group("game")[0]
onready var btn_buy = $BtnBuy
onready var tex_icon = $TexIcon
onready var lbl_price = $LblPrice
onready var lbl_name = $LblName

var TowerPreview = preload("res://helpers/tower_preview/TowerPreview.tscn")

var tower_id = -1
var tower_data
var is_unlocked = false

signal tower_selected(tower_id)
signal tower_unlocked(tower_id)

	
func set_tower_id(p_tower_id, unlocked):
	tower_id = p_tower_id
	is_unlocked = unlocked

	lbl_name.text = GameData.get_tower_property(tower_id, "name")
	tex_icon.texture = load(GameData.get_tower_property(tower_id, "icon_path"))

	tower_data = GameData.get_tower_dict(tower_id)
	
	if is_unlocked:
		lbl_price.text = str(GameData.get_tower_property(tower_id, "cost"))
	else:
		lbl_price.text = str(GameData.get_tower_property(tower_id, "unlock_cost"))


func _on_BtnBuy_pressed():
	$AudioClick.play()
	# start tower preview
	if not is_unlocked:
		if game.money >= GameData.get_tower_property(tower_id, "unlock_cost"):
			game.money -= GameData.get_tower_property(tower_id, "unlock_cost")
			is_unlocked = true
			btn_buy.disabled = false
			#get_tree().get_nodes_in_group("game")[0]._show_popup("-" + str(GameData.get_tower_property(tower_id, "unlock_cost")) + " Energy",rect_position)
			emit_signal("tower_unlocked", tower_id)
			visible = false
			queue_free()
			return
		else:
			Notifier.notify_error("Not enough money!")
			return

	for i in get_tree().get_nodes_in_group("preview"):
		i.queue_free()
		i.set_process(false)
		i.set_visible(false)

	var inst = TowerPreview.instance()
	planet.add_child(inst)
	inst.set_tower_id(tower_id)
	#inst.connect("tower_preview_placed", self, "_on_TowerPreview_placed")
	emit_signal("tower_selected", tower_id)



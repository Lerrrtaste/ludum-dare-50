extends PanelContainer

var ShopItem = preload("res://ui/shop/shop_item/ShopItem.tscn")

onready var container_defenese = $CategoryTabs/Defense
onready var container_resource = $CategoryTabs/Resource
onready var container_research = $CategoryTabs/Research

func _ready():
	get_tree().get_nodes_in_group("game")[0].connect("wave_changed", self, "_on_Game_wave_changed")

	# populate shop list
	var tower_ids = GameData._tower_ids
	
	for i in tower_ids.values():
		if i < 0:
			continue
		
		var unlocked = (0 >= GameData.get_tower_property(i, "unlock_year"))
		var container
		
		if not unlocked:
			container = container_research
		elif GameData.get_tower_property(i, "resource"): # is resource
			container = container_resource
		else:
			container = container_defenese

		var item = ShopItem.instance()
		container.add_child(item)
		item.set_tower_id(i,unlocked)
		item.connect("tower_selected", self, "_on_ShopItem_item_selected")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_mask == BUTTON_RIGHT and event.pressed:
			visible = false

func _on_ShopItem_item_selected(tower_id):
	visible = false

func _on_Game_wave_changed(wave):
	var totest = container_research.get_children()
	
	for i in totest:
		if (wave >= GameData.get_tower_property(i.tower_id, "unlock_year")):
			var tid = i.tower_id
			i.visible = false
			i.queue_free()
			var container = container_defenese
			
			if GameData.get_tower_property(tid, "resource"): # is resource
				container = container_resource
			else:
				container = container_defenese
			
			for t in container.get_children():
				if t.tower_id == tid:
					continue
			
			var item = ShopItem.instance()
			container.add_child(item)
			item.set_tower_id(tid, true)

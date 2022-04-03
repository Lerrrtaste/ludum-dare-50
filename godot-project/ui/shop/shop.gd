extends PanelContainer

var ShopItem = preload("res://ui/shop/shop_item/ShopItem.tscn")

onready var list_towers = $VBoxContainer/TowerList
onready var container_defenese = $CategoryTabs/Defense/DefenseGrid
onready var container_resource = $CategoryTabs/Resource/ResourceGrid

func _ready():
	# populate shop list
	var tower_ids = GameData._tower_ids
	
	for i in tower_ids.values():
		if i < 0:
			return
		
		var container = container_defenese
		if GameData.get_tower_property(i, "resource"): # is resource
			container = container_resource

		var item = ShopItem.instance()
		item.set_tower_id(i)
		container.add_child(item)
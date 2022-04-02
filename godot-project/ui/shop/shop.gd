extends PanelContainer

onready var list_towers = $VBoxContainer/TowerList

func _ready():
	# populate shop list
	var tower_data = GameData._tower_data.Towers
	
	for i in tower_data:
		 list_towers.

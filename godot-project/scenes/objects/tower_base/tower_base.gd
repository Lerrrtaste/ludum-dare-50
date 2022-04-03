extends Node2D

const TOWER_ID = -1

var tower_data
var hp = -1

func _ready():
	tower_data = GameData.get_tower_dict(0)
	hp = tower_data.hp
	

func receive_damage(damage:int):
	hp -= damage
	
	$HpBar.visible = true
	$HpBar.value = (float(hp)/float(tower_data.hp))*100.0
	
	if hp <= 0:
		emit_signal("tower_destroyed")
		set_process(false)
		visible = false
		queue_free()


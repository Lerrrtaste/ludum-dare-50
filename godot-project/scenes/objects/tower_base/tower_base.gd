extends Node2D

const TOWER_ID = -1

var tower_data
var hp = -1

func _ready():
	tower_data = GameData.get_tower_dict(0)
	hp = tower_data.hp

func _process(delta: float):
	hp -= 1
	print(hp / tower_data.hp)
	$HpBar.value = hp / tower_data.hp

func recieve_damage(damage:int):
	Notifier.notify_debug("Tower Damaged")
	hp -= damage
	
	if hp <= 0:
		emit_signal("tower_destroyed")
		set_process(false)
		visible = false
		queue_free()


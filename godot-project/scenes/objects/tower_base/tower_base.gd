extends Node2D

var tower_data
var tower_id = -1
var hp = -1

var target
var shoot_last = 0


func _ready():
	set_process(false)


func _process(delta):
	if target:
		$SprTarget.position = target.position
	
	if "projectile" in tower_data and tower_data.projectile > 0 and target:
		if OS.get_ticks_msec() - shoot_last >= tower_data.firerate*1000:
			shoot()
			shoot_last = OS.get_ticks_msec()


func shoot():
	
	print("Base shooting")


func load_tower(p_tower_id):
	tower_data = GameData.get_tower_dict(p_tower_id)
	tower_id = p_tower_id
	hp = tower_data.hp
	
	if "range" in tower_data:
		$AreaRange/CollisionShape2D.shape.radius = tower_data.range
		$AreaRange.connect("area_entered", self, "_on_AreaRange_area_entered")
		$AreaRange.connect("area_exited", self, "_on_AreaRange_area_exited")
	
	set_process(true)


func receive_damage(damage:int):
	hp -= damage
	
	$HpBar.visible = true
	$HpBar.value = (float(hp)/float(tower_data.hp))*100.0
	
	if hp <= 0:
		emit_signal("tower_destroyed")
		set_process(false)
		visible = false
		queue_free()


func _on_AreaRange_area_entered(area):
	if not target and area.get_parent().has_method("receive_damage"):
		target = area.get_parent()
		$SprTarget.visible = true
		print("New Target", area.get_parent())

func _on_AreaRange_area_exited(area):
	if target and target == area.get_parent():
		target = null
		$SprTarget.visible = false
		print("Target lost", area.get_parent())

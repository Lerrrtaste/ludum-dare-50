extends Node2D

onready var game = get_tree().get_nodes_in_group("game")[0]

var tower_data
var tower_id = -1
var hp = -1

var target
var in_range := []
var shoot_last = 0


func _ready():
	set_process(false)


func _process(delta):
	if target:
		if not is_instance_valid(target):
			target = null
			update_auto_target()
			return
		$SprBarrel.rotation = (target.position - global_position).angle() -rotation+ deg2rad(90)
		
		if OS.get_ticks_msec() - shoot_last >= tower_data.firerate*1000:
			print($SprTower.frame)
			shoot()
			shoot_last = OS.get_ticks_msec()
			update_auto_target()


func shoot():
	print("Base shooting (not good!)")


func load_tower(p_tower_id):
	tower_data = GameData.get_tower_dict(p_tower_id)
	tower_id = p_tower_id
	hp = tower_data.hp
	
	if "range" in tower_data:
		$AreaRange/CollisionShape2D.shape.radius = tower_data.range
		$AreaRange.connect("area_entered", self, "_on_AreaRange_area_entered")
		$AreaRange.connect("area_exited", self, "_on_AreaRange_area_exited")
	
	$SprBarrel.frames.set_animation_speed("active", 1/GameData.get_tower_property(tower_id, "firerate"))
	$SprTower.frames.set_animation_speed("active", 1/GameData.get_tower_property(tower_id, "firerate"))
	
	set_process(true)


func receive_damage(damage:int):
	hp -= damage
	$AudioDamage.play()
	
	$HpBar.visible = true
	$HpBar.value = (float(hp)/float(tower_data.hp))*100.0
	
	if hp <= 0:
		emit_signal("tower_destroyed")
		set_process(false)
		visible = false
		queue_free()


func update_auto_target():
	in_range = $AreaRange.get_overlapping_areas()
	
	var closest
	for i in in_range:
		if not i or not i.get_parent().has_method("receive_damage"):
			continue
		if abs((i.position-position).angle()) - rotation > 40:
			continue
		if not closest or closest.get_parent().global_position-position > i.get_parent().global_position-position:
			closest = i
	
	if closest:
		target = closest.get_parent()
		$SprBarrel.play("active")
		$SprTower.play("active")
		$SprTarget.visible = true
	else:
		$SprBarrel.play("idle")
		$SprTower.play("idle")
		$SprTarget.visible = false

func _on_AreaRange_area_entered(area):
	update_auto_target()
	
func _on_AreaRange_area_exited(area):
	update_auto_target()

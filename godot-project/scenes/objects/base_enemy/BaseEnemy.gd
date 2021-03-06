extends Node2D

var death_part = preload("res://helpers/particles/DeathParticle.tscn") 

var planet
var target
var hp
var hp_max
var damage
var speed
var direction
var fire_rate

signal damage_dealt
signal died

func _ready():
	planet = get_tree().get_nodes_in_group("planet")[0]
	if (global_position - planet.global_position).length() >100:
		direction = (global_position - planet.global_position).normalized().rotated((deg2rad(randi()%20) -10)) #Vector2(randi(), randi()).normalized() #random start speed
	else:
		direction=Vector2((randi()%100)-50,(randi()%100)-50).normalized()
	target = planet.position
	hp_max = hp

func _process(delta):
	pass

func set_target_to_nearest():
	var closest=Vector2(999999,999999) #fist we assume that the planet is closets
	var towers=get_tree().get_nodes_in_group("towers")
	if towers.empty():
		#target planet when no towers available
		closest=planet.position
	else:
		#check for a tower that is nearer
		for k in towers:
			if (k.global_position-position).length() < (closest-position).length(): #is the tower k nearer the the current clostest
				closest = k.global_position
	target = closest
	
func receive_damage(amount):
	$HpBar.visible = true
	hp = hp - amount
	$HpBar.value = (float(hp)/float(hp_max))
	print("hp",hp," hpmax",hp_max, " value", $HpBar.value)
	$AnimationPlayer.stop(true)
	$AnimationPlayer.play("damage")
	get_tree().get_nodes_in_group("game")[0]._show_popup("-"+str(amount),global_position)
	# die
	if hp <= 0:
		var inst = death_part.instance()
		get_parent().add_child(inst)
		inst.global_position = global_position
		hp=0
		var money = randi()%50+51
		get_tree().get_nodes_in_group("game")[0]._show_popup("+"+str(money)+" Energy",global_position)
		get_tree().get_nodes_in_group("game")[0].money += money
		die()
	emit_signal("damage_dealt", amount)

func die():
	emit_signal("died")
	visible=false
	set_process(false)
	queue_free()
	
func _on_Area2D_area_entered(area):
	if area.get_parent().has_method("receive_damage"):
		area.get_parent().receive_damage(damage)
		die()

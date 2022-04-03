extends Node2D

var planet
var target
var hp
var damage
var speed
var direction
var fire_rate

signal damage_dealt
signal died

func _ready():
	direction= Vector2(randi(), randi()).normalized() #random start speed
	planet=get_tree().get_nodes_in_group("planet")[0]
	target=planet.position

func _process(delta):
	pass

func receive_damage(amount):
	hp = hp - amount

	# die
	if hp <= 0:
		hp=0
		die()
		return

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

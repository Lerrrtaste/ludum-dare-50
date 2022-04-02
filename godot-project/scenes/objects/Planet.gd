extends Node2D

onready var sprite=$Sprite

signal damage_dealt
signal died
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const max_hp=1000
var hp=max_hp;

# Called when the node enters the scene tree for the first time.
func _ready():
	receive_damage(20)
	yield(get_tree().create_timer(1.0),"timeout")
	receive_damage(400)
	yield(get_tree().create_timer(1.0),"timeout")
	receive_damage(1000)
	yield(get_tree().create_timer(1.0),"timeout")
	pass # Replace with function body.

func receive_damage(amount):
	hp=hp-amount;
	# handle over /underflow
	if hp <= 0:
		hp=0
		emit_signal("died")
	if hp > max_hp:
		hp=max_hp;
	#load texture according to hp
	if hp >= 666:
		sprite.texture = load("res://scenes/objects/planet-good.png")
	if hp < 666 and hp > 333:
		sprite.texture = load("res://scenes/objects/planet-medium.png")
	if hp <= 333:
		sprite.texture = load("res://scenes/objects/planet-worse.png")
	emit_signal("damage_dealt", amount)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

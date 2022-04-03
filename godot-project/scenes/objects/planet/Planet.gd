extends Node2D

onready var sprite=$Sprite
onready var collision_shape = $AreaBody/CollisionShape2D
signal damage_dealt
signal died

const max_hp=1000
var hp=max_hp;

func _ready():
	pass

func receive_damage(amount):
	hp=hp-amount;

	# die
	if hp <= 0:
		hp=0
		emit_signal("died")
		return

	# anticheat 2000
	if hp > max_hp:
		hp=max_hp;

#	#load texture according to hp
#	if hp >= 666:
#		sprite.texture = load("res://scenes/objects/planet-good.png")
#	if hp < 666 and hp > 333:
#		sprite.texture = load("res://scenes/objects/planet-medium.png")
#	if hp <= 333:
#		sprite.texture = load("res://scenes/objects/planet-worse.png")

	emit_signal("damage_dealt", amount)

func get_outer_pos(mouse_pos:Vector2)->Vector2:
	return (mouse_pos - position).normalized() * collision_shape.shape.radius

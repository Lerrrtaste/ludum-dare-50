extends "res://scenes/objects/tower_base/tower_base.gd"

onready var TOWER_ID = GameData._tower_ids.SNIPER
#onready var Projectile =  load(GameData.get_projectile_property(GameData._projectile_ids.SNIPER, "scene_path"))
var line_to
var line_a := 1.0

func _ready():
	._ready()
	.load_tower(TOWER_ID)

func shoot():
#	var inst = Projectile.instance()
#	game.add_child(inst)
#	inst.position = global_position
#	var direction = target.position - global_position
#	direction += (target.speed*target.direction.normalized())*2 # add expected movement until impact
#	inst.start(direction, false)
#	$SprTarget.global_position = global_position+direction
	#line_to = (target.position - global_position).angle() - rotation - deg2rad(90)
	line_to = target.global_position# - global_position# (Vector2(1,0)*line_to).normalized() * position.distance_to(target.position)
	$Tween.interpolate_property(self, "line_a", 1.0, 0.0, 0.4, Tween.TRANS_QUAD,Tween.EASE_OUT)
	$Tween.start()
	target.receive_damage(GameData.get_tower_property(TOWER_ID,"damage"))
	SoundPlayer.play("sniper.wav")

func _process(delta):
	._process(delta)
	update()

func _draw():
	if line_to:
		draw_line(Vector2(),line_to-global_position,ColorN("white",line_a), 1)


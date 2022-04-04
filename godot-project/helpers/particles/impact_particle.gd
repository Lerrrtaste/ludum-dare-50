extends Particles2D

#var death_part = preload("res://helpers/particles/DeathParticle.tscn") 
#var inst = death_part.instance()
#get_parent().add_child(inst)
#inst.global_position = global_position

func _ready():
	emitting=true
	yield(get_tree().create_timer(lifetime), "timeout")
	queue_free()
	

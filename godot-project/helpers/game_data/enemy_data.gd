extends GDScript

enum Enemies {
	DEFAULT = -1,
	METEOR1,
	METEOR2,
}

enum DamageType {
	NONE = -1,
	IMPACT,
	PROJECTILE,
}

var _ENEMY_DATA = {
	Enemies.DEFAULT: {
		"start_year": 0,
		"damage_type": DamageType.NONE,
		"damage_amount": 0,
		"projectile": null, #for shooting enemies
		"speed": 10,
	},
	Enemies.METEOR1: {
		"damage_type": DamageType.IMPACT,
		"damage_amount": 25,
		"speed": 10,
		"scene_path": "res://scenes/objects/meteor/Meteor.tscn",
	},
	Enemies.METEOR2: {
		"damage_type": DamageType.IMPACT,
		"damage_amount": 50,
		"speed": 10,
		"scene_path": "res://scenes/objects/meteor/Meteor.tscn",
	},
}

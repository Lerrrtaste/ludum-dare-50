extends GDScript

enum Enemies {
	DEFAULT = -1,
	METEOR1,
	METEOR2,
	UFO,
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
		"hp": 30,
	},
	Enemies.METEOR1: {
		"damage_type": DamageType.IMPACT,
		"damage_amount": 20,
		"speed": 20,
		"hp": 30,
		"scene_path": "res://scenes/objects/base_enemy/meteor/Meteor.tscn",
	},
	Enemies.METEOR2: {
		"damage_type": DamageType.IMPACT,
		"damage_amount": 40,
		"speed": 50,
		"hp": 30,
		"scene_path": "res://scenes/objects/base_enemy/meteor/Meteor.tscn",
	},
	Enemies.UFO: {
		"damage_type": DamageType.IMPACT,
		"damage_amount": 40,
		"speed": 50,
		"hp": 30,
		"scene_path": "res://scenes/objects/base_enemy/ufo/ufo.tscn",
	},
}

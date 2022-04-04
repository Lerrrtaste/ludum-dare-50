extends GDScript

enum Enemies {
	DEFAULT = -1,
	METEOR,
	METEORBIG,
	UFO,
	UFOBIG,
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
		"fire_rate": 0.0, # in sec
	},
	Enemies.METEOR: {
		"damage_type": DamageType.IMPACT,
		"damage_amount": 20,
		"speed": 20,
		"hp": 30,
		"scene_path": "res://scenes/objects/base_enemy/meteor/Meteor.tscn",
	},
	Enemies.METEORBIG: {
		"damage_type": DamageType.IMPACT,
		"damage_amount": 40,
		"speed": 50,
		"hp": 30,
		"scene_path": "res://scenes/objects/base_enemy/meteor_big/Meteor_big.tscn",
	},
	Enemies.UFO: {
		"damage_type": DamageType.IMPACT,
		"damage_amount": 40,
		"speed": 50,
		"hp": 30,
		"fire_rate": 2.0, # in sec
		"scene_path": "res://scenes/objects/base_enemy/ufo/ufo.tscn",
	},
	Enemies.UFOBIG: {
		"damage_type": DamageType.IMPACT,
		"damage_amount": 60,
		"speed": 50,
		"hp": 60,
		"fire_rate": 2.0, # in sec
		"scene_path": "res://scenes/objects/base_enemy/ufo_big/ufo_big.tscn",
	},
}

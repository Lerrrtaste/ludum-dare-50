extends GDScript

enum Projectiles {
	DEFAULT = -1,
	MG,
	SNIPER,
	FLAK,
	MISSILE,
	LASER,
	NUKE,
}

var _PROJECTILE_DATA = {
	Projectiles.DEFAULT: {
			"damage":10,
			"speed":100
	},
	Projectiles.MG: {
		"damage":5,
		"speed":100,
		"scene_path": "res://scenes/objects/BaseProjectile/mg/mg.tscn",
	},
	Projectiles.SNIPER: {
		"damage":200,
		"speed":500,
		"scene_path": "res://scenes/objects/BaseProjectile/sniper/sniper.tscn",
	},
	Projectiles.FLAK: {
		"damage":50,
		"speed":50,
		"scene_path": "res://scenes/objects/BaseProjectile/flak/flak.tscn",
	},
	Projectiles.MISSILE: {
		"damage":40,
		"speed":40,
		"scene_path": "res://scenes/objects/BaseProjectile/missile/missile.tscn",
	},
	Projectiles.LASER: {
		"damage":25,
		"speed":150,
		"scene_path": "res://scenes/objects/BaseProjectile/laser/laser.tscn",
	},
	Projectiles.NUKE: {
		"damage":50,
		"speed":40,
		"scene_path": "res://scenes/objects/BaseProjectile/nuke/nuke.tscn",
	},
}

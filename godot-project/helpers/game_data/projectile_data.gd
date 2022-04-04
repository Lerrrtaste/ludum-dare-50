extends GDScript

enum Projectiles {
	DEFAULT = -1,
	MG,
	SNIPER,
	FLAK,
	MISSILE,
}

var _PROJECTILE_DATA = {
	Projectiles.DEFAULT: {
			"damage":10,
			"speed":100
	},
	Projectiles.MG: {
		"damage":10,
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
		"speed":20,
		"scene_path": "res://scenes/objects/BaseProjectile/flak/flak.tscn",
	},
		Projectiles.MISSILE: {
		"damage":50,
		"speed":20,
		"scene_path": "res://scenes/objects/BaseProjectile/missile/missile.tscn",
	},
}

extends GDScript

enum Towers {
	DEFAULT = -1,
	RESOURCE_STORAGE,
	RESOURCE_EXTRACTOR,
	MG,
	FLAK,
	MISSILE,
	SNIPER,
}

var _TOWER_DATA = {
	Towers.DEFAULT: {
		"name": "N/A",
		"icon_path": null,
		"scene_path": null,
		"resource": false, #category
		"unlock_year": 0,
		"hp": 200,
		"cost": 0,
		"range": 0,
		"projectile": -1,
		"firerate": 1, # cooldown btween projectiles
		"resource_generation": 0,  #adds x resources per second
		"resource_storage_capacity": 10,  #can store x resources max
	},
	Towers.RESOURCE_STORAGE: {
		"name": "Resource Storage",
		"icon_path": "res://scenes/objects/tower_base/defense_tower_placeholder.png",
		"scene_path": null,
		"resource": true,
		"unlock_year": 0,
		"hp": 300,
		"cost": 150,
		"resource_storage_capacity": 1000,
	},
	Towers.RESOURCE_EXTRACTOR: {
		"name": "Resource Extractor",
		"icon_path": "res://scenes/objects/tower_base/defense_tower_placeholder.png",
		"scene_path": null,
		"resource": true,
		"unlock_year": 0,
		"hp": 50,
		"cost": 25,
		"resource_generation": 10,
		"resource_storage_capacity": 100,
	},
	Towers.MG: {
		"name": "Machine Gun Turret",
		"icon_path": "res://scenes/objects/tower_mg/tower_mg_icon.png",
		"scene_path": "res://scenes/objects/tower_mg/TowerMg.tscn",
		"resource": false,
		"unlock_year": 0,
		"hp": 50,
		"cost": 50,
		"range": 100,
		"firerate": .25,
	},
	Towers.FLAK: {
		"name": "Flak Turret",
		"icon_path": "res://scenes/objects/tower_flak/tower_flak_icon.png",
		"scene_path": "res://scenes/objects/tower_flak/TowerFlak.tscn",
		"resource": false,
		"unlock_year": 2,
		"hp": 100,
		"cost": 100,
		"range": 75,
		"firerate": .8,
	},
	Towers.SNIPER: {
		"name": "Sniper Turret",
		"icon_path": "res://scenes/objects/tower_sniper/sniper_tower_icon.png",
		"scene_path": "res://scenes/objects/tower_sniper/TowerSniper.tscn",
		"resource": false,
		"unlock_year": 1,
		"hp": 50,
		"cost": 50,
		"range": 100,
		"damage": 10,
		"firerate": 5,
	},Towers.MISSILE: {
		"name": "Missile Turret",
		"icon_path": "res://scenes/objects/tower_missile/missile_tower_icon.png",
		"scene_path": "res://scenes/objects/tower_missile/TowerMissile.tscn",
		"resource": false,
		"unlock_year": 3,
		"hp": 100,
		"cost": 20,
		"range": 75,
		"firerate": 3,
	},
}

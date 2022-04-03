extends GDScript

enum Towers {
	DEFAULT = -1,
	RESOURCE_STORAGE,
	RESOURCE_EXTRACTOR,
	MG,
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
		"icon_path": "res://scenes/objects/tower_base/defense_tower_placeholder.png",
		"scene_path": "res://scenes/objects/tower_mg/TowerMg.tscn",
		"resource": false,
		"unlock_year": 0,
		"hp": 100,
		"cost": 75,
		"range": 100,
		"projectile": 1,
		"firerate": .5,
	},
}

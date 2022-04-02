extends GDScript

enum Tower {
	DEFAULT = -1,
	RESOURCE_STORAGE,
	RESOURCE_EXTRACTOR,
}

var _TOWER_DATA = {
	Tower.DEFAULT: {
		"name": "N/A",
		"unlock_year": 0,
		"hp": 100,
		"cost": 0,
		"resource_generation": 0,  #adds x resources per second
		"resource_storage_capacity": 10,  #can store x resources max
	},
	Tower.RESOURCE_STORAGE: {
		"unlock_year": 0,
		"hp": 300,
		"cost": 0,
		"resource_storage_capacity": 1000,
	},
	Tower.RESOURCE_EXTRACTOR: {
		"unlock_year": 0,
		"hp": 50,
		"cost": 0,
		"resource_generation": 10,
		"resource_storage_capacity": 100,
	},
}

extends GDScript


var _WAVE_DATA = {
	-1: { # default values
		"duration": 1, # seconds
		"enemies": {
			0.0: [EnemiesData.None]
		},
	},

	1: {
		"duration": 20,
		"enemies": {
			0.0: {
				EnemiesData.METEOR1: 1,
			},
			0.2: {
				EnemiesData.METEOR1: 1,
			},
			0.4: {
				EnemiesData.METEOR1: 2,
			},
			0.6: {
				EnemiesData.METEOR2: 1,
			},
			0.7: {
				EnemiesData.METEOR1: 1,
			},
			0.8: {
				EnemiesData.METEOR2: 2,
			},
			0.9: {
				EnemiesData.METEOR1: 2,
			},
		},
	},
}


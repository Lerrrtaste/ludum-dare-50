extends GDScript


var Enemies = load("res://helpers/game_data/enemy_data.gd").new().Enemies

var _WAVE_DATA = {
	-1: { # default values
		"duration": 1, # seconds
		"enemies": {

			0.0: [Enemies.DEFAULT],
		},
	},

	1: {
		"duration": 20,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEORBIG,
				"count": 8,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEORBIG,
				"count": 4,
				"timestamp": 0.2
			},
			{
				"id": Enemies.METEORBIG,
				"count": 20,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEORBIG,
				"count": 2,
				"timestamp": 0.4
			},
			{
				"id": Enemies.METEORBIG,
				"count": 5,
				"timestamp": 0.5
			},
			{
				"id": Enemies.METEORBIG,
				"count": 2,
				"timestamp": 0.7
			},
			{
				"id": Enemies.METEORBIG,
				"count": 2,
				"timestamp": 0.9
			},
		],
	},
	2: {
		"duration": 20,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.UFO,
				"count": 1,
				"timestamp": 0.1
			},
			{
				"id": Enemies.UFO,
				"count": 3,
				"timestamp": 0.3
			},
			{
				"id": Enemies.UFO,
				"count": 8,
				"timestamp": 0.6
			},
		]
	}
}

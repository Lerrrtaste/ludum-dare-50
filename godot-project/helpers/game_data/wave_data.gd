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
		"duration": 60,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEOR,
				"count": 1,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEOR,
				"count": 2,
				"timestamp": 0.5
			},
			{
				"id": Enemies.METEOR,
				"count": 1,
				"timestamp": 0.7
			},
		],
	},
	2: {
		"duration": 60,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEOR,
				"count": 1,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEOR,
				"count": 2,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEOR,
				"count": 1,
				"timestamp": 0.6
			},
						{
				"id": Enemies.METEOR,
				"count": 3,
				"timestamp": 0.8
			},
		],
	},
	3: {
		"duration": 60,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEOR,
				"count": 6,
				"timestamp": 0.1
			},
			{
				"id": Enemies.UFO,
				"count": 1,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEORBIG,
				"count": 1,
				"timestamp": 0.6
			},
			{
				"id": Enemies.UFO,
				"count": 3,
				"timestamp": 0.8
			},
		]
	},
	4: {
		"duration": 60,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEORBIG,
				"count": 5,
				"timestamp": 0.1
			},
			{
				"id": Enemies.UFO,
				"count": 4,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEOR,
				"count": 10,
				"timestamp": 0.6
			},
			{
				"id": Enemies.UFOBIG,
				"count": 3,
				"timestamp": 0.8
			},
		]
	},
	5: {
		"duration": 30,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEORBIG,
				"count": 5,
				"timestamp": 0.1
			},
			{
				"id": Enemies.UFO,
				"count": 10,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEORBIG,
				"count": 4,
				"timestamp": 0.6
			},
			{
				"id": Enemies.UFOBIG,
				"count": 6,
				"timestamp": 0.8
			},
		]
	},
	6: {
		"duration": 10,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEORBIG,
				"count": 15,
				"timestamp": 0.1
			},
			{
				"id": Enemies.UFOBIG,
				"count": 16,
				"timestamp": 0.8
			},
			{
				"id": Enemies.UFO,
				"count": 25,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEORBIG,
				"count": 10,
				"timestamp": 0.6
			},
			{
				"id": Enemies.UFOBIG,
				"count": 16,
				"timestamp": 0.8
			},
		]
	},
}

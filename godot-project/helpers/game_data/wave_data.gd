extends GDScript


var Enemies = load("res://helpers/game_data/enemy_data.gd").new().Enemies

var _WAVE_DATA = {
	-1: { # default values
		"duration": 1, # seconds
		"enemies": {

			0.0: [Enemies.DEFAULT],
		},
	},
#	1: {
#		"duration": 60,
#		# note elements of the array must be sorted is ascending order by timestamp
#		"enemies": [
#			{
#				"id": Enemies.UFO,
#				"count": 12,
#				"timestamp": 0.1
#			},
#			{
#				"id": Enemies.METEOR,
#				"count": 4,
#				"timestamp": 0.2
#			},
#			{
#				"id": Enemies.UFO,
#				"count": 6,
#				"timestamp": 0.3
#			},
#			{
#				"id": Enemies.METEORBIG,
#				"count": 2,
#				"timestamp": 0.4
#			},
#			{
#				"id": Enemies.UFOBIG,
#				"count": 12,
#				"timestamp": 0.5
#			},
#			{
#				"id": Enemies.UFO,
#				"count": 10,
#				"timestamp": 0.6
#			},
#			{
#				"id": Enemies.METEOR,
#				"count": 6,
#				"timestamp": 0.7
#			}]},
	1: {
		"duration": 20,
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
				"timestamp": 0.4
			},
			{
				"id": Enemies.METEOR,
				"count": 1,
				"timestamp": 0.6
			},
		],
	},
	2: {
		"duration": 20,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEOR,
				"count": 3,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEOR,
				"count": 2,
				"timestamp": 0.2
			},
			{
				"id": Enemies.METEOR,
				"count": 2,
				"timestamp": 0.4
			},
						{
				"id": Enemies.METEOR,
				"count": 3,
				"timestamp": 0.6
			},
		],
	},
	3: {
		"duration": 30,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEOR,
				"count": 2,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEOR,
				"count": 4,
				"timestamp": 0.2
			},
			{
				"id": Enemies.METEOR,
				"count": 4,
				"timestamp": 0.4
			},
			{
				"id": Enemies.METEORBIG,
				"count": 1,
				"timestamp": 0.6
			},
		]
	},
	4: {
		"duration": 20,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEOR,
				"count": 6,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEOR,
				"count": 7,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEORBIG,
				"count": 2,
				"timestamp": 0.5
			},
			{
				"id": Enemies.METEOR,
				"count": 4,
				"timestamp": 0.6
			},
		]
	},
	5: {
		"duration": 30,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEOR,
				"count": 5,
				"timestamp": 0.1
			},
			{
				"id": Enemies.UFO,
				"count": 2,
				"timestamp": 0.2
			},
			{
				"id": Enemies.UFO,
				"count": 4,
				"timestamp": 0.5
			},
			{
				"id": Enemies.METEOR,
				"count": 6,
				"timestamp": 0.6
			},
		]
	},
	6: {
		"duration": 20,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEOR,
				"count": 12,
				"timestamp": 0.1
			},
			{
				"id": Enemies.UFO,
				"count": 4,
				"timestamp": 0.2
			},
			{
				"id": Enemies.UFO,
				"count": 6,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEOR,
				"count": 3,
				"timestamp": 0.4
			},
			{
				"id": Enemies.UFO,
				"count": 6,
				"timestamp": 0.5
			}]
		},
		7: {
		"duration": 30,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.UFO,
				"count": 10,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEOR,
				"count": 6,
				"timestamp": 0.2
			},
			{
				"id": Enemies.UFO,
				"count": 3,
				"timestamp": 0.3
			},
			{
				"id": Enemies.UFOBIG,
				"count": 1,
				"timestamp": 0.5
			},
			{
				"id": Enemies.UFO,
				"count": 5,
				"timestamp": 0.7
			}]
		},
		8: {
		"duration": 30,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.UFO,
				"count": 12,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEOR,
				"count": 6,
				"timestamp": 0.2
			},
			{
				"id": Enemies.UFOBIG,
				"count": 3,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEORBIG,
				"count": 1,
				"timestamp": 0.5
			},
			{
				"id": Enemies.UFO,
				"count": 6,
				"timestamp": 0.6
			}]
		},
		9: {
		"duration": 60,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.UFO,
				"count": 12,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEOR,
				"count": 4,
				"timestamp": 0.2
			},
			{
				"id": Enemies.UFO,
				"count": 6,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEORBIG,
				"count": 2,
				"timestamp": 0.4
			},
			{
				"id": Enemies.UFOBIG,
				"count": 12,
				"timestamp": 0.5
			},
			{
				"id": Enemies.UFO,
				"count": 10,
				"timestamp": 0.6
			},
			{
				"id": Enemies.METEOR,
				"count": 6,
				"timestamp": 0.7
			}]
		}
	}


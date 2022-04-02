extends GDScript

<<<<<<< HEAD
var Enemies = GameData.EnemyData.Enemies
=======
var Enemies = load("res://helpers/game_data/enemy_data.gd").new().Enemies
>>>>>>> aaaad2f (Started Tower Base; Added HP Bar; Fixed GameData)

var _WAVE_DATA = {
	-1: { # default values
		"duration": 1, # seconds
		"enemies": {
			0.0: [Enemies.NONE],
<<<<<<< HEAD
		},
	},

	1: {
		"duration": 20,
		# note elements of the array must be sorted is ascending order by timestamp
		"enemies": [
			{
				"id": Enemies.METEOR1,
				"count": 1,
				"timestamp": 0.1
			},
			{
				"id": Enemies.METEOR1,
				"count": 1,
				"timestamp": 0.2
			},
			{
				"id": Enemies.METEOR1,
				"count": 2,
				"timestamp": 0.3
			},
			{
				"id": Enemies.METEOR2,
				"count": 1,
				"timestamp": 0.4
			},
			{
				"id": Enemies.METEOR2,
				"count": 1,
				"timestamp": 0.5
			},
			{
				"id": Enemies.METEOR2,
				"count": 2,
				"timestamp": 0.7
			},
			{
				"id": Enemies.METEOR1,
				"count": 2,
				"timestamp": 0.9
			},
		],
	},
}
=======
		}}}
#	},
#	}
#
#	1: {
#		"duration": 20,
#		"enemies": {
#			0.0: {
#				Enemies.METEOR1: 1,
#			},
#			0.2: {
#				Enemies.METEOR1: 1,
#			},
#			0.4: {
#				Enemies.METEOR1: 2,
#			},
#			0.6: {
#				Enemies.METEOR2: 1,
#			},
#			0.7: {
#				Enemies.METEOR1: 1,
#			},
#			0.8: {
#				Enemies.METEOR2: 2,
#			},
#			0.9: {
#				Enemies.METEOR1: 2,
#			},
#		},
#	},
#}
#
>>>>>>> aaaad2f (Started Tower Base; Added HP Bar; Fixed GameData)

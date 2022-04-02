extends GDScript

var Enemies = GameData.EnemyData.Enemies

var _WAVE_DATA = {
	-1: { # default values
		"duration": 1, # seconds
		"enemies": {
			0.0: [Enemies.NONE],
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

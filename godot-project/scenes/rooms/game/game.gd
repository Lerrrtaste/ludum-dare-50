extends Node2D



func _ready():
	Notifier.notify_game("Test")

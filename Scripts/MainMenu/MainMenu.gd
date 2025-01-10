extends Node

@onready var gameScene : String = "res://Scenes/Game/Game.tscn"

func StartGame():
	print("start game")
	get_tree().change_scene_to_file(gameScene)

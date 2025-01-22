extends Node

@export var mainMenuScript : Node2D

func _on_pressed() -> void:
	mainMenuScript.StartGame()

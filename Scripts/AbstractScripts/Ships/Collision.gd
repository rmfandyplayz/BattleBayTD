extends Area2D
class_name BaseMouseClickAreaDetector

## For now, this only detects user input, and calls the parent
## would be funny if this detects cannon bullets too instead of the other way around
## just saying

var _mouse_is_inside : bool = false

func _on_mouse_entered() -> void:
	_mouse_is_inside = true

func _on_mouse_exited() -> void:
	_mouse_is_inside = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("leftClick") and _mouse_is_inside :
		$"../AbstractFriendlyShip".mouseSelected()

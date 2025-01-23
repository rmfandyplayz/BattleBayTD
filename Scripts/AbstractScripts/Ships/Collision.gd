extends Area2D
class_name BaseMouseClickAreaDetector

## For now, this only detects user input, and calls the parent
## would be funny if this detects cannon bullets too instead of the other way around
## just saying

var CanBeSelected : bool = false

func _on_mouse_entered() -> void:
	CanBeSelected = true

func _on_mouse_exited() -> void:
	CanBeSelected = false

func _ready() -> void:
	InputSharedProcessor.AttachSelf(self)

func _input(event: InputEvent) -> void:
	if not event.is_action_pressed("leftClick") :
		return
	if CanBeSelected :
		$"../AbstractFriendlyShip".MouseSelected()
	else :
		$"../AbstractFriendlyShip".ConsiderShooting()

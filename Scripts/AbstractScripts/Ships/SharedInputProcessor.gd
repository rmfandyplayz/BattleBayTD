extends Node

## Preloaded script to handle input (mouse)
## Must have a `var IsSelected : bool` to attach

var _consideredItems : Array

## allows a input detector to attach itself to this
func AttachSelf(item) -> void:
	if not ("CanBeSelected" in item) :
		return
	_consideredItems.append(item)
	
## allows a input detector to detach itself to this
func DetachSelf(item) -> void:
	var whereToDetachFrom : int = _consideredItems.find(item)
	if whereToDetachFrom == -1 :
		return # this should not be possible
	_consideredItems.remove_at(_consideredItems.find(item))

func YouShouldShoot() -> bool:
	for item in _consideredItems :
		if item.CanBeSelected :
			return false
	return true

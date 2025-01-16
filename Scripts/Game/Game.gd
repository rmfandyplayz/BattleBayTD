extends Node
class_name Game

## general logic for the game where giving them a separate script would be unecessary
## that, or stuff like variables that should be controlled globally

static var isAShipSelected : bool = false # is there a ship being selected (to potentially use the weapon/item)?



static func GetShipSelected(): #returns the status of whether a ship is being selected or not
	return isAShipSelected
static func SetShipSelected(newStatus : bool): #sets the status of whether a ship is being selected
	isAShipSelected = newStatus


#loads the game from the json file
func LoadGameFromFile():
	pass

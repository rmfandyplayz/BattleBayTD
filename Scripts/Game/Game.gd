extends Node
class_name Game

## the brain of the game
## general logic for the game where giving them a separate script would be unecessary
## that, or stuff like variables that should be controlled globally
## written by Andy (@rmfandyplayz)

static var isAShipSelected : bool = false # is there a ship being selected (to potentially use the weapon/item)?

static var currentGold : int
static var maxGold : int = 5500000
static var currentSugar : int
static var maxSugar : int = 2000000
static var pearls : int


static func GetShipSelected(): #returns the status of whether a ship is being selected or not
	return isAShipSelected
static func SetShipSelected(newStatus : bool): #sets the status of whether a ship is being selected
	isAShipSelected = newStatus


#loads the game from the json file
func LoadGameFromFile():
	pass

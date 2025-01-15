extends BaseShip
class_name FriendlyShip

## abstract base class for all friendly ships that the player can use
## all subsequent player ships should inherit from this script
##
## (obviously, contains everything every player ship has in common)

var shipCoords : Vector2 # defines the coordinates of the ship. x is the row, y is the column

# should all be pretty self explanatory; only applies to the lane the ship is in
enum targetPriority {
	CLOSEST_FIRST = 1,
	FARTHEST_FIRST = 2,
	LOWEST_HEALTH = 3,
	HIGHEST_HEALTH = 4,
	MANUAL = 5 # ship will not automatically fire weapon off-cooldown. will be player-controlled
}

func _ready() -> void:
	team = 1
	
# uses whatever item that is equipped to the boat
func UseItem(targetPos : Vector2):
	# plan: access the item that should be part of the child and use it
	# (probably through the FireWeapon() function)
	pass

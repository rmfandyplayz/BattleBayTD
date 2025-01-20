extends BaseShip
class_name FriendlyShip

## abstract base class for all friendly ships that the player can use
## all subsequent player ships should inherit from this script
##
## (obviously, contains everything every player ship has in common)

var shipCoords : Vector2 # defines the coordinates of the ship. x is the row, y is the column

@export var cannonBall : PackedScene

# should all be pretty self explanatory; only applies to the lane the ship is in
enum TargetPriorities {
	CLOSEST_FIRST = 1,
	FARTHEST_FIRST = 2,
	LOWEST_HEALTH = 3,
	HIGHEST_HEALTH = 4,
	MANUAL = 5 # ship will not automatically fire weapon off-cooldown. will be player-controlled
}

func _ready() -> void:
	team = 1
	_functions_test()

func _functions_test() -> void: # fires a function in a loop so we know it works
	while true :
		var mousePos : Vector2 = get_global_mouse_position()
		#print(mousePos)
		UseItem(mousePos)
		await get_tree().create_timer(1).timeout

## selects the ship to potentially use the item. this function should ideally call "UseItem()"
func SelectForFire():
	if(Game.GetShipSelected() == false):
		pass	

## uses whatever item that is equipped to the boat
func UseItem(targetPos : Vector2):
	# plan: access the item that should be part of the child and use it
	# (probably through the FireWeapon() function)
	var projectile : Sprite2D = cannonBall.instantiate()
	get_tree().root.add_child.call_deferred(projectile)
	projectile.launched_pos = global_position
	projectile.target_pos = targetPos
	#print("launched")

extends BaseShip
class_name FriendlyShip

## abstract base class for all friendly ships that the player can use
## all subsequent player ships should inherit from this script
##
## (obviously, contains everything every player ship has in common)

var shipCoords : Vector2 # defines the coordinates of the ship. x is the row, y is the column
var currentPriority : TargetPriorities = TargetPriorities.CLOSEST_FIRST 
var previousPriority : TargetPriorities = currentPriority

@export var cannonBall : PackedScene
@export var cooldownBetweenShots : float = 0.3

@export var cannonWeapon : BaseCannonWeapon

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
	_openFire()

# based on the target priority, select a position to shoot at
func _identifyTarget() -> Vector2 :
	if currentPriority == TargetPriorities.MANUAL :
		return get_global_mouse_position()
	else : 
		return Vector2.ZERO # TODO: implement

# shows muzzle flash, and tells the weapon to fire
func _fireAtPosition(where : Vector2) -> void :
	_showMuzzleFlashOrSmth()
	
	cannonWeapon.FireWeapon(where)

# shows art that tells player we be sh00ting
func _showMuzzleFlashOrSmth() -> void:
	pass # TODO: implement

func _openFire() -> void: # fires a function in a loop so we know it works
	while true :
		var targetPositon : Vector2 = _identifyTarget()
			
		_fireAtPosition(targetPositon)
		await get_tree().create_timer(cooldownBetweenShots).timeout

## sets firemode from mannual, to mannual, and back.
func mouseSelected() -> void:
	if currentPriority == TargetPriorities.MANUAL :
		# un-mannual
		currentPriority = previousPriority
		$"../BeingSelectedIndicator".visible = false
	else :
		previousPriority = currentPriority
		currentPriority = TargetPriorities.MANUAL
		$"../BeingSelectedIndicator".visible = true

## selects the ship to potentially use the item. this function should ideally call "UseItem()"
func SelectForFire():
	if(Game.GetShipSelected() == false):
		pass	

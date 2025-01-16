extends BaseShip
class_name EnemyShip

## abstract base class for all enemy ships that can be spawned
## all subsequent enemy ship classes should inherit from this
##
## contains everything that enemy ships have in common, i.e. speed

@export var speed : float
var lane : int # which lane is the enemy in? TODO: planned feature: set to -1 to allow free-moving ships.

enum AIType {
	CLOSE_RANGED,
	MID_RANGED,
	FAR_RANGED
}

func _ready() -> void:
	team = 2

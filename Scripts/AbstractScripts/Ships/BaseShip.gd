extends Node2D
class_name BaseShip

## this is the base abstract class for all ships. Every subsequent ship script
## should inherit from this script. (doesn't matter if it's player or enemy)
##
## contains basic elements and functions that all ships share in common (i.e. health)

@export var maxHealth : int
@export var currentHealth : int # ship's health.
@export var defense : int # damage resistance
@export var team : int # which team is the ship on (to distinguish between player/enemy)

# slot points. 0 to disable that slot entirely
@export var redSlotPoints : int
@export var blueSlotPoints : int
@export var yellowSlotPoints : int
@export var greenSlotPoints : int

# the items the ship has equipped
@export var equippedItems : Array[BaseItem]

# what ship is this?
enum ShipTypes {
	SHOOTER = 1,
	DEFENDER = 2,
	SPEEDER = 3,
	ENFORCER = 4,
	FIXER = 5
}



# FUNCTIONS ===============================================================================

## make the ship take some damage and runs logic attached to it. 
## can optionally disable playing the damage sounds
## playing sound is enabled by default
func TakeDamage(damage : int, playSound : bool = true):
	currentHealth -= damage
	if currentHealth <= 0:
		Die()


## kills the ship
func Die():
	queue_free()

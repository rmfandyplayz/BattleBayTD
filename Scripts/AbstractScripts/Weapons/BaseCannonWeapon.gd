extends BaseRedItem
class_name BaseCannonWeapon

## inherits from BaseRedItem. this is an abstract class
## all cannon-type weapons should inherit form this
## 
## contains everything that cannons share in common

@export var range : float
@export var projectileSpeed : float
@export var critChance : float
@export var fireBonus : float # applies extra damage to burning enemies

func _ready() -> void:
	SetItemSlotType(slotType)

func FireWeapon(target : Node2D):
	pass

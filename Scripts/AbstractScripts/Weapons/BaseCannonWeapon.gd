extends BaseRedItem
class_name BaseCannonWeapon

## inherits from BaseRedItem. this is an abstract class
## all cannon-type weapons should inherit form this
## 
## contains everything that cannons share in common

@export var itemRange : float
@export var projectileSpeed : float
@export var critChance : float
@export var fireBonus : float # applies extra damage to burning enemies
@export var cannonBall : PackedScene

func _ready() -> void:
	InitializeItemElements($AbstractWeapon)
	SetItemSlotType(slotType)
	SetItemLevel(itemLevel)
	


func FireWeapon(targetPos : Vector2):
	var projectile : Cannon_ball = cannonBall.instantiate()
	get_tree().root.add_child.call_deferred(projectile)
	projectile.launched_pos = global_position
	projectile.target_pos = targetPos
	projectile.firedFrom = self # the bullets looks here for damage info

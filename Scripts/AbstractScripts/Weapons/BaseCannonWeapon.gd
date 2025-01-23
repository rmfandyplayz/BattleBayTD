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
@export var cooldownBetweenShots : float = 360 ## Fun fact, this is in miliseconds

var _last_time_we_fired : float = 0

func _ready() -> void:
	InitializeItemElements($AbstractWeapon)
	SetItemSlotType(slotType)
	SetItemLevel(itemLevel)
	

func ableToFire() -> bool:
	var able : bool = (Time.get_ticks_msec() - _last_time_we_fired) > cooldownBetweenShots
	if able :
		_last_time_we_fired = Time.get_ticks_msec() # A.K.A now
		able = able and InputSharedProcessor.YouShouldShoot()
	return able 

func FireWeapon(targetPos : Vector2):
	if not ableToFire() :
		if not InputSharedProcessor.YouShouldShoot() :
			print("well that worked")
		return
	var projectile : Cannon_ball = cannonBall.instantiate()
	get_tree().root.add_child.call_deferred(projectile)
	projectile.launched_pos = global_position
	projectile.target_pos = targetPos
	projectile.firedFrom = self # the bullets looks here for damage info

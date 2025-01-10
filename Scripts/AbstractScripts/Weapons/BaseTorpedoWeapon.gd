extends BaseRedItem
class_name BaseTorpedoWeapon

## inherits from BaseRedItem. this is an abstract class
## all torpedo-type weapons should inherit form this
## 
## contains everything that torpedoes share in common

@export var projectileSpeed : float
@export var slowedBonus : float # applies extra damage to slowed enemeis
@export var radius : float # applies some damage in an area around the explosion area

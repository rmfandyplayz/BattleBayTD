extends BaseRedItem
class_name BaseMortarWeapon

## inherits from BaseRedItem. this is an abstract class
## all mortar-type weapons should inherit form this
## 
## contains everything that mortars share in common

@export var range : float
@export var radius : float
@export var slowedBonus : float # applies extra damage to slowed enemies

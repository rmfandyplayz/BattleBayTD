extends Node2D
class_name BaseBullet

## the abstract base class for all bullets found in game
## every subsequent bullet created will inherit from this script
## used by both player and enemy

@export var damage : int
@export var team : int

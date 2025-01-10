extends Node2D
class_name BaseItem

## the abstract base class for all weapons. all weapons will inherit this one
##
## contains things that every weapon has in common

enum slotType { # the type of slot this item will take up
	RED = 1,
	BLUE = 2,
	YELLOW = 3,
	GREEN = 4
}

@export var slotPoints : int # num of slot points this item will take up in the respective slot type

@export var level : int # the level of this item. determines how strong this item will be. max level 50

extends Node2D
class_name BaseItem

## the abstract base class for all weapons. all weapons will inherit this one
##
## contains things that every weapon has in common

enum slotTypes { # the type of slot this item will take up
	RED = 1,
	BLUE = 2,
	YELLOW = 3,
	GREEN = 4
}

@export var slotType : slotTypes
@export var slotPoints : int # num of slot points this item will take up in the respective slot type
@export var itemLevel : int = 1 # the level of this item. determines how strong this item will be. max level 25



@onready var borderCommon : Sprite2D = $ItemBorderCommon
@onready var borderUncommon : Sprite2D = $ItemBorderUncommon
@onready var borderRare : Sprite2D = $ItemBorderRare
@onready var borderEpic : Sprite2D = $ItemBorderEpic
@onready var borderLegendary : Sprite2D = $ItemBorderLegendary
@onready var itemTierI : Sprite2D = $ItemTierI
@onready var itemTierII : Sprite2D = $ItemTierII
@onready var itemTierIII : Sprite2D = $ItemTierIII
@onready var itemTierIV : Sprite2D = $ItemTierIV
@onready var itemTierV : Sprite2D = $ItemTierV
@onready var setInvisibleList : Array[Sprite2D] = [ # elements to set invisible before re-setting the item level
	borderCommon, 
	borderUncommon, 
	borderRare, 
	borderEpic, 
	borderLegendary,
	itemTierI,
	itemTierII,
	itemTierIII,
	itemTierIV,
	itemTierV
	]
func SetItemLevel(newLevel : int):
	for element : Sprite2D in setInvisibleList:
		element.visible = false
	
	match newLevel % 5:
		0: # tier V
			itemTierV.visible = true
		1: # tier I
			itemTierI.visible = true
		2: # tier II
			itemTierII.visible = true
		3: # tier III
			itemTierIII.visible = true
		4: # tier IV
			itemTierIV.visible = true
		_: # if code for some reason decided to go out of range
			itemTierI.visible = true
	
	if newLevel >= 1 and newLevel <= 5:
		borderCommon.visible = true
	elif newLevel >= 6 and newLevel <= 10:
		borderUncommon.visible = true
	elif newLevel >= 11 and newLevel <= 15:
		borderRare.visible = true
	elif newLevel >= 16 and newLevel <= 20:
		borderEpic.visible = true
	elif newLevel >= 21 and newLevel <= 25:
		borderLegendary.visible = true
	else: # if any of the code for some reason decided to go out of range
		borderCommon.visible = true
	
	itemLevel = newLevel



#sets the slot type that the item will be
func SetItemSlotType(newSlotType : slotTypes):
	if newSlotType == slotTypes.RED:
		self_modulate = Color.RED
	elif newSlotType == slotTypes.BLUE:
		self_modulate = Color.DODGER_BLUE
	elif newSlotType == slotTypes.YELLOW:
		self_modulate = Color.YELLOW
	elif newSlotType == slotTypes.GREEN:
		self_modulate = Color.LIME_GREEN
	
	slotType = newSlotType

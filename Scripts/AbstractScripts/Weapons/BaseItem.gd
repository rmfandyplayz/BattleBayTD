extends Node2D
class_name BaseItem

## written by Andy (@rmfandyplayz)
## the abstract base class for all weapons. all weapons will inherit this one
##
## contains things that every weapon has in common
## fyi: don't use engine-called functions cuz they will be called here... unless that's what u intend lol

enum SlotTypes { # the type of slot this item will take up
	RED = 1,
	BLUE = 2,
	YELLOW = 3,
	GREEN = 4
}

@export var slotType : SlotTypes
@export var slotPoints : int # num of slot points this item will take up in the respective slot type
@export var itemLevel : int = 1 # the level of this item. determines how strong this item will be. max level 25

var itemBackground : Sprite2D
var borderCommon : Sprite2D
var borderUncommon : Sprite2D
var borderRare : Sprite2D
var borderEpic : Sprite2D
var borderLegendary : Sprite2D
var itemTierI : Sprite2D
var itemTierII : Sprite2D
var itemTierIII : Sprite2D
var itemTierIV : Sprite2D
var itemTierV : Sprite2D
var setInvisibleList : Array[Sprite2D] # elements to set invisible before re-setting the item level



## initialize all of the sprites and whatnot
func InitializeItemElements(abstractWeaponPath : Node2D):
	itemBackground = get_node(abstractWeaponPath.name + "/ItemBackground")
	borderCommon = get_node(abstractWeaponPath.name + "/ItemBorderCommon")
	borderUncommon = get_node(abstractWeaponPath.name + "/ItemBorderUncommon")
	borderRare = get_node(abstractWeaponPath.name + "/ItemBorderRare")
	borderEpic = get_node(abstractWeaponPath.name + "/ItemBorderEpic")
	borderLegendary = get_node(abstractWeaponPath.name + "/ItemBorderLegendary")
	itemTierI = get_node(abstractWeaponPath.name + "/ItemTierI")
	itemTierII = get_node(abstractWeaponPath.name + "/ItemTierII")
	itemTierIII = get_node(abstractWeaponPath.name + "/ItemTierIII")
	itemTierIV = get_node(abstractWeaponPath.name + "/ItemTierIV")
	itemTierV = get_node(abstractWeaponPath.name + "/ItemTierV")
	
	setInvisibleList = [
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



## sets the level of the item (both visually and in-code)
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
		_: # base case: if code for some reason decided to go out of range
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
	else: # base case: if any of the code for some reason decided to go out of range
		borderCommon.visible = true
	
	itemLevel = newLevel



#sets the slot type that the item will be
func SetItemSlotType(newSlotType : SlotTypes):
	if newSlotType == SlotTypes.RED:
		itemBackground.self_modulate = Color.RED
	elif newSlotType == SlotTypes.BLUE:
		itemBackground.self_modulate = Color.DODGER_BLUE
	elif newSlotType == SlotTypes.YELLOW:
		itemBackground.self_modulate = Color.YELLOW
	elif newSlotType == SlotTypes.GREEN:
		itemBackground.self_modulate = Color.LIME_GREEN
	
	slotType = newSlotType

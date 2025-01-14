extends Node

## general logic and functions for some in-game UI elements where giving them a dedicated script would be overkill


# FYI: if "isAddition" is true, it will add to the current value instead of setting it to whatever "value" is.
# this applies to all of these "update currency" things.

@export var goldValueText : Label
@export var goldBar : TextureProgressBar
func UpdateGold(value : int, isAddition : bool = true):
	if(isAddition == true):
		goldBar.value += value
	else:
		goldBar.value = value

@export var sugarValueText : Label
@export var sugarBar : TextureProgressBar
func UpdateSugar(value : int, isAddition : bool = true):
	if(isAddition == true):
		sugarBar.value += value
	else:
		sugarBar.value = value

@export var pearlValueText : Label
func UpdatePearls(value : int, isAddition : bool = true):
	var numPearls : int = int(pearlValueText.text)
	if(isAddition == true):
		numPearls += value
	else:
		numPearls = value
	
	pearlValueText.text = str(numPearls)

extends Control

## general logic and functions for some in-game UI elements
## written by Andy (@rmfandyplayz)


#region currency-related stuff
@export var textTweenTransitionTime : float = 0.5

@export var goldValueText : Label
@export var goldBar : TextureProgressBar
@export var sugarValueText : Label
@export var sugarBar : TextureProgressBar
@export var pearlValueText : Label

# updates whatever bar and text is needed - both visually and in the code. returns the new value of the currency
func UpdateCurrency(
	newValue : int,
	valueTextLabel : Label,
	currentValue : int,
	#tween : Tween,
	bar : TextureProgressBar = null,
	maxValue : int = -1, # -1 for no cap to the max value (i.e. pearls)
	isChange : bool = true # changes the current resource value by "newValue" instead of setting it to "newValue"
) -> int:
	var targetValue : int
	if(isChange == true):
		targetValue = currentValue + newValue
	else:
		targetValue = newValue
	
	# apply the resource cap if maxValue isn't -1
	if(maxValue != -1):
		targetValue = clamp(targetValue, 0, maxValue)
		if(targetValue >= maxValue):
			valueTextLabel.self_modulate = Color.RED
		else:
			valueTextLabel.self_modulate = Color.WHITE

	# smoothly update the resource bar thingy (if one exists)
	if(bar != null):
		create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT).tween_property(
			bar, 
			"value", 
			targetValue, 
			textTweenTransitionTime
		)
	
	# update the text 
	create_tween().set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT).tween_method(
		Helper_OnTextTweenStep.bind(targetValue, valueTextLabel), 
		currentValue, 
		targetValue, 
		textTweenTransitionTime
	)
	
	return targetValue

# helper function for UpdateCurrency() function.
func Helper_OnTextTweenStep(startValue : int, endValue : int, valueTextLabel : Label):
	var currentValue = lerp(startValue, endValue, textTweenTransitionTime)
	valueTextLabel.text = Helper_FormatNumber(int(currentValue))

# formats numbers like this : 3 000 000. 
func Helper_FormatNumber(value: int) -> String:
	if(value < 10000):
		return str(value) # dont format the numbers if it's below 10 000

	var numString = str(value)
	var result = ""
	for i in range(len(numString)):
		if(i > 0 and (len(numString) - i) % 3 == 0):
			result += " "
		result += numString[i]
	return result

#endregion
	
	
	
	
	
	
# TESTING STUFF BELOW!!! DELETE THESE LATER

func _ready() -> void:
	await get_tree().create_timer(1.5).timeout
	Game.currentGold = UpdateCurrency(1000000, goldValueText, Game.currentGold, goldBar, Game.maxGold)
	Game.currentSugar = UpdateCurrency(500000, sugarValueText, Game.currentSugar, sugarBar, Game.maxSugar)
	Game.pearls = UpdateCurrency(1984, pearlValueText, Game.pearls)


func changing() -> void:
	if(int($"Test Stuff/mode".text) == 1):
		Game.currentGold = UpdateCurrency(int($"Test Stuff/amount".text), goldValueText, Game.currentGold, goldBar, Game.maxGold)
	elif(int($"Test Stuff/mode".text) == 2):
		Game.currentSugar = UpdateCurrency(int($"Test Stuff/amount".text), sugarValueText, Game.currentSugar, sugarBar, Game.maxSugar)
	elif(int($"Test Stuff/mode".text) == 3):
		Game.pearls = UpdateCurrency(int($"Test Stuff/amount".text), pearlValueText, Game.pearls)
	

func setting() -> void:
	if(int($"Test Stuff/mode".text) == 1):
		Game.currentGold = UpdateCurrency(int($"Test Stuff/amount".text), goldValueText, Game.currentGold, goldBar, Game.maxGold, false)
	elif(int($"Test Stuff/mode".text) == 2):
		Game.currentSugar = UpdateCurrency(int($"Test Stuff/amount".text), sugarValueText, Game.currentSugar, sugarBar, Game.maxSugar, false)
	elif(int($"Test Stuff/mode".text) == 3):
		Game.pearls = UpdateCurrency(int($"Test Stuff/amount".text), pearlValueText, Game.pearls, null, -1, false)

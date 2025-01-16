extends Node

## functions for animating the flags when they need to be raised
## (for when a huge wave of ships are approaching)

@export var greenFlag : TextureRect
@export var redFlag : TextureRect

func RaiseFlag():
	await create_tween().tween_property(redFlag, "self_modulate", Color.TRANSPARENT, 0.2).finished
	redFlag.visible = false
	greenFlag.visible = true
	create_tween().tween_property(greenFlag, "self_modulate", Color.WHITE, 0.2)
	create_tween().set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT).tween_property(greenFlag, "scale", Vector2(1.4, 1.4), 0.4)

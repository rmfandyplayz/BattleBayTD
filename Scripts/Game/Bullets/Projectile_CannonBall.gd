extends BaseBullet
class_name Cannon_ball

## Cannon bullet. Intended to be attached to cannonballs
##
## When instantiated, will move to target pos while curving upward
## Mimics how projectiles in real life works
## Travels in constant time regardless of distance (lol)

var elapsed_time : float = 0
var total_distance : float
var control_pos : Vector2
var firedFrom : BaseCannonWeapon # used to determine the stats such as damage
var launched_pos : Vector2
var target_pos : Vector2

# returns the position on a bezier curve based on time (https://en.wikipedia.org/wiki/B%C3%A9zier_curve)
# An implementation of the bezier curve basically pasted from desmos (https://www.desmos.com/calculator/scz7zhonfw)
# Just think of it as a blackbox. 3 position and time goes in, position on curve gets out
func _Bezier_spline_blackbox(delta_time : float, start_pos : Vector2, goal_pos : Vector2,control_pos : Vector2) -> Vector2:
	var p : Vector2 = start_pos
	var q : Vector2 = control_pos
	var s : Vector2 = goal_pos
	
	var t : float = delta_time
	
	var a : Vector2 = q + (1-t) * (p-q)
	var b : Vector2 = q + t*(s-q)
	return a + t*(b-a)
	
func _ready() -> void:
	var difference : Vector2 = (launched_pos-target_pos)
	total_distance = difference.length()
	global_position = launched_pos
	control_pos = (launched_pos+target_pos)/2 + total_distance * Vector2.UP

func _explode() -> void:
	pass # TODO: implement

func _process(delta: float) -> void:
	elapsed_time += delta#/(total_distance)
	global_position = _Bezier_spline_blackbox(elapsed_time,launched_pos,target_pos,control_pos)
	if elapsed_time >= 1.0 :
		self.set_process(false)
		_explode()
		self.queue_free()

extends Sprite2D

var elapsed_time : float = 0
var total_distance : float
var control_pos : Vector2

var launched_pos : Vector2
var target_pos : Vector2

# returns the position based on time
func _calculate_offset_position_on_curve(delta_time : float, start_pos : Vector2, goal_pos : Vector2,control_pos : Vector2) -> Vector2:
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
	control_pos = (launched_pos+target_pos)/2 + total_distance * Vector2.UP

func _explode() -> void:
	pass # TODO: implement

func _process(delta: float) -> void:
	elapsed_time += delta#/(total_distance)
	global_position = _calculate_offset_position_on_curve(elapsed_time,launched_pos,target_pos,control_pos)
	if elapsed_time >= 1.0 :
		_explode()
		self.queue_free()

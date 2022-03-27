extends CanvasLayer

signal use_move_vector
signal fire_pressed

func _input(event):
	if event is InputEventScreenTouch or event is InputEventScreenDrag:
		if $JoyStick.is_pressed():
			var move_vector = calculate_move_vector(event.position)
			emit_signal("use_move_vector", move_vector)
		if $Fire.is_pressed():
			emit_signal("fire_pressed")
func calculate_move_vector(event_position):
	var texture_center = $JoyStick.position + Vector2(16,16)
	return (event_position - texture_center).normalized()
	

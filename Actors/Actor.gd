extends KinematicBody2D
class_name Actor

func CalcVel(velocity, drag, direction, max_speed):
	var ideal_vel = direction * max_speed
	var steering = ideal_vel - velocity
	
	velocity += steering/drag
	velocity = velocity.clamped(max_speed)
	
	return velocity

extends Actor

export var max_speed = 1000.0
export var drag = 4.0

var _velocity = Vector2.ZERO

onready var _sprite = $Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("MoveRight") - Input.get_action_strength("MoveLeft")
	direction.y = Input.get_action_strength("MoveDown") - Input.get_action_strength("MoveUp")
	direction = direction.normalized()
	_velocity = CalcVel(_velocity, drag, direction, max_speed)
	_velocity = move_and_slide(_velocity)
	rotation = lerp_angle(rotation, _velocity.angle() + PI/2 - PI/2, 20.0 * delta)

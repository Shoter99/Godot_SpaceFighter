extends Actor

export var max_speed = 600.0
export var drag = 4.0
export var bullet_speed = 1000.0
export var fire_rate = .2

var bullet = preload("res://Actors/Bullet.tscn")
var can_fire = true
var direction = Vector2.ZERO
var _velocity = Vector2.ZERO

onready var _sprite = $Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
#	direction.x = Input.get_action_strength("MoveRight") - Input.get_action_strength("MoveLeft")
#	direction.y = Input.get_action_strength("MoveDown") - Input.get_action_strength("MoveUp")
#	direction = direction.normalized()
	
	rotation = lerp_angle(rotation, _velocity.angle() + PI/2 - PI/2, 20.0 * delta)
#	look_at(get_global_mouse_position())
	
	if Input.is_action_just_pressed("Shoot") and can_fire:
		shoot()

func shoot():
		var bullet_instance = bullet.instance()
		bullet_instance.position = get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees
		bullet_instance.apply_impulse(Vector2.ZERO, Vector2(bullet_speed,0).rotated(rotation))
		get_tree().get_root().add_child(bullet_instance)
		
		can_fire = false
		yield(get_tree().create_timer(fire_rate), "timeout")
		can_fire = true

func _on_MobileJoystick_use_move_vector(move_vector):
	direction = move_vector
	_velocity = CalcVel(_velocity, drag, direction, max_speed)
	_velocity = move_and_slide(_velocity)


func _on_MobileJoystick_fire_pressed():
	shoot()

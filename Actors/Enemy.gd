extends KinematicBody2D


var player = null
var move = Vector2.ZERO
export var speed = 1000.0
var move_rot = Vector2.ZERO
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _process(delta):
	move = Vector2.ZERO
	
	if player != null:
		move = position.direction_to(player.position) * speed	* delta
	else:
		move = Vector2.ZERO
	
	move = move.normalized()
	move_rot = move_and_slide(move)
	move = move_and_collide(move)
	rotation = lerp_angle(rotation, move_rot.angle() + PI/2 - PI/2, 20.0 * delta)

func _on_Area2D_body_entered(body):
	if body != self:
		player = body
		

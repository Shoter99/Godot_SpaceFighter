extends KinematicBody2D


onready var player = $"/root/Node2D/Player"
var move = Vector2.ZERO
export var speed = 1000.0
var move_rot = Vector2.ZERO
var following = true
# Called when the node enters the scene tree for the first time.

func _process(delta):
	move = Vector2.ZERO
	
	if following:
		move = position.direction_to(player.position) * speed	* delta
		move = move.normalized()
		move_rot = move_and_slide(move)
		move = move_and_collide(move)
		rotation = lerp_angle(rotation, move_rot.angle() + PI/2 - PI/2, 20.0 * delta)
	else:
		move = Vector2.ZERO
		var dir = player.position - position
		rotation = dir.angle()
		
		
	
	



func _on_Area2D_body_entered(body):
	if body == player:
		following = false
		


func _on_Area2D_body_exited(body):
	if body == player:
		following = true

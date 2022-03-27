extends KinematicBody2D


onready var player = $"/root/Node2D/Player"
var move = Vector2.ZERO
export var speed = 1000.0
export var bullet_speed = 300.0
var move_rot = Vector2.ZERO
var following = true
var fire_rate = .4
var bullet = preload("res://Actors/EnemyBullet.tscn")
var can_fire = true
# Called when the node enters the scene tree for the first time.

func _process(delta):
	move = Vector2.ZERO
	if player != null:
		if following:
			move = position.direction_to(player.position) * speed * delta
			move = move.normalized()
			move_rot = move_and_slide(move)
			move = move_and_collide(move)
			rotation = lerp_angle(rotation, move_rot.angle() + PI/2 - PI/2, 20.0 * delta)
		else:
			move = Vector2.ZERO
			var dir = player.position - position
			rotation = dir.angle()
			if can_fire:
				var bullet_instance = bullet.instance()
				bullet_instance.position = get_global_position()
				bullet_instance.rotation_degrees = rotation_degrees
				bullet_instance.apply_impulse(Vector2.ZERO, Vector2(bullet_speed,0).rotated(rotation))
				$"/root/Node2D".add_child(bullet_instance)
				
				can_fire = false
				yield(get_tree().create_timer(fire_rate), "timeout")
				can_fire = true
		
		
	
	



func _on_Area2D_body_entered(body):
	if body == player:
		following = false
		


func _on_Area2D_body_exited(body):
	if body == player:
		following = true

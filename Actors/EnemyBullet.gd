extends RigidBody2D

func _on_EnemyBullet_body_entered(body):
	if !is_in_group("enemy"):
		if body == $"/root/Node2D/Player":
			get_tree().reload_current_scene()
			Variables.current_points = 0
		else:
			queue_free()

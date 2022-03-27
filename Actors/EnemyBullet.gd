extends RigidBody2D

func _on_EnemyBullet_body_entered(body):
	if !is_in_group("enemy"):
		if body == $"/root/Node2D/Player":
			print("player hit!")
			get_tree().reload_current_scene()
			for enemy in get_tree().get_nodes_in_group("enemy"):
				enemy.queue_free()
			for bullet in get_tree().get_nodes_in_group("bullet"):
				bullet.queue_free()
			Variables.current_points = 0
		else:
			queue_free()

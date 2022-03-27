extends Node



var enemy = preload("res://Actors/Enemy.tscn")
var pos = [Vector2(1000,30), Vector2(1000, 580), Vector2(500, 580), Vector2(500, 30), Vector2(30, 30)]
var spawn_timer = 2.5
var can_spawn = true

func _ready():
	randomize()

func _process(delta):
		if can_spawn:
			var enemy_instance = enemy.instance()
			var curr_pos = pos[randi() % pos.size()]
			enemy_instance.position = curr_pos
			$"/root/Node2D".add_child(enemy_instance)
			can_spawn = false
			spawn_timer -= .01
			yield(get_tree().create_timer(spawn_timer), "timeout")
			can_spawn = true

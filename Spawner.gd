extends Node


var warning = preload("res://Actors/Warning.tscn")
var enemy = preload("res://Actors/Enemy.tscn")
var pos = [Vector2(1000,30), Vector2(1000, 580), Vector2(500, 580), Vector2(500, 30), Vector2(30, 30)]
var spawn_timer = 2.5
var can_spawn = true

func _ready():
	randomize()

func _process(delta):
		if can_spawn:
			var curr_pos = pos[randi() % pos.size()]
			var warning_instance = warning.instance()
			warning_instance.position = curr_pos
			$"/root/Node2D".add_child(warning_instance)
			can_spawn = false
			spawn_timer -= .05
			yield(get_tree().create_timer(spawn_timer/3), "timeout")
			var enemy_instance = enemy.instance()
			
			enemy_instance.position = curr_pos
			warning_instance.queue_free()
			$"/root/Node2D".add_child(enemy_instance)
			yield(get_tree().create_timer(spawn_timer/1.5), "timeout")
			can_spawn = true

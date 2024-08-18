extends Node2D




func spawn_mob():
	var new_enemy = preload("res://scen/enemy.tscn").instantiate()
	%PathFollow2D.progress_ratio = randf()
	new_enemy.global_position = %PathFollow2D.global_position
	add_child(new_enemy)
	


func _on_timer_timeout():
	spawn_mob()


func _on_player_health_dep():

	%gameover.visible = true
	get_tree().paused = true

extends Area2D



	
	
func shoot ():           ## for auto-aim
	if Input.is_action_pressed("shoot"):
		const BULLET = preload("res://scens/player/gun/bullet.tscn")
		var new_bullet = BULLET.instantiate()
		new_bullet.global_position = $pivot/Icon/shooting.global_position
		new_bullet.global_rotation = $pivot/Icon/shooting.global_rotation
		$pivot/Icon/shooting.add_child(new_bullet)
		

func _on_timer_timeout():
	shoot()

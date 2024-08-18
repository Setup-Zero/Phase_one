extends Area2D

@onready var animat= $AnimatedSprite2D
#$Timer
var gun_cooldown :bool = true
func _process(delta):
	if Input.is_action_just_pressed("shoot") and gun_cooldown:
		animat.play("gun_eqip")
		gun_cooldown = false
		$Timer.start()
		shoot()
	look_at(get_global_mouse_position())

func _physics_process(delta):
	#var in_range = get_overlapping_bodies()
	#if in_range.size() >0:
	#	var target = in_range.front()
		#look_at(target.global_position)
	if global_position.x < 1:
		animat.flip_v  = true
	elif global_position.x >1:
		animat.flip_v = false

func shoot():           ## for auto-aim
	const BULLET = preload("res://scen/bullet.tscn")
	var new_bullet = BULLET.instantiate()
	new_bullet.global_position = %shootpoint.global_position
	new_bullet.global_rotation = %shootpoint.global_rotation
	%shootpoint.add_child(new_bullet)
		


func _on_timer_timeout():
	gun_cooldown = true
		#shoot()




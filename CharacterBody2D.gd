extends CharacterBody2D
@onready var anim = $AnimatedSprite2D
@onready var hurt = $hurt
@onready var player = $"."
@onready var progress_bar = $ProgressBar

var health: = 100:
	set(value):
		health = value
		progress_bar.value = value
		if health <= 0:
			get_tree().change_scene_to_file("res://scen/respawn_screen.tscn")
signal  health_dep
@export var knock_back_power = 500
func _physics_process(delta):
	var input_vector = Input.get_vector("left","right","up","down")
	velocity = input_vector * 100.0
	
	if input_vector == Vector2(): 
		anim.play("idle")
	else:
		anim.play("run")
	if input_vector.x < 0:
		anim.flip_h  = true
	elif input_vector.x >0:
		anim.flip_h = false
	move_and_slide()
	
	
func _input(event):
	if event.is_action_pressed("shoot"):
		anim.play("shoot")

#func _on_hurt_body_entered(body):
#	take_dmg()
#	print(health)
func take_dmg():
	health -= 10


func _on_hurt_area_entered(area):
	take_dmg()
#	print(health)

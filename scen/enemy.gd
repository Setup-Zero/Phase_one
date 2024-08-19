extends CharacterBody2D
@onready var animation_player = $AnimationPlayer
@onready var progress_bar = $ProgressBar

var enemy_killed = 0

var health: = 100:
	set(value):
		health = value
		progress_bar.value = value
		if value <=0:
			queue_free()
			
			
			Global.wave_counter()
@onready var movement_speed = 40.0
@onready var player = get_tree().get_first_node_in_group("player")
@onready var anim = $AnimatedSprite2D
var camera2d: Camera2D
var shack_noice : FastNoiseLite
func _ready():
	anim.play("run")
	#camera2d = get_tree().get_first_node_in_group("camera")
	#shack_noice = FastNoiseLite.new()
	
func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed

	anim.play("run")
	if direction.x < 0:
		anim.flip_h  =true
	elif direction.x >0:
		anim.flip_h = false
	move_and_slide()
	
	
func take_dmg():
	health -= 30
	animation_player.play("hit")
	#var camera_tween = get_tree().create_tween()
	#camera_tween.tween_method(start_camera_shack, 5.0 , 1.0 , 0.5 )
	print(health)
	#if health ==0:
	#	queue_free()
	
#func start_camera_shack(intensity:float):
#	var camera_offset = shack_noice.get_noise_1d(Time.get_ticks_msec())*intensity
#	camera2d.offset.x = camera_offset
	#camera2d.offset.y = camera_offset
	


#func _on_hit_body_entered(body):
	#pass # Replace with function body.

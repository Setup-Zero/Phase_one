extends CharacterBody2D

@onready var sprite= $Sprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var progress_bar = $ui/ProgressBar
@onready var player = get_parent().find_child("player")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var direction :  Vector2
var health: = 100:
	set(value):
		health = value
		progress_bar.value = value
		if value <=0:
			progress_bar.visible = false
			find_child("StateFiniteMachine").change_state("death")
func _physics_process(delta):
	# Add the gravity.
	if  is_on_floor():
		velocity.x += gravity * delta
	velocity = direction.normalized() * gravity
	move_and_collide(velocity *delta )
	move_and_slide()
	
	
	
func _process(delta):
	direction = player.position - position
	if direction.x<0:
		sprite.flip_h = true
	else:
		sprite.flip_h = false




extends CharacterBody2D
@onready var character_body_2d = $"."
@onready var player = get_tree().get_first_node_in_group("player")
@onready var progress_bar = $ProgressBar
@onready var animation_player = $AnimationPlayer

var direction : Vector2

func _process(delta):
	direction = player.position - position
	animation_player.play("run")
func take_dmg():
	animation_player.play("hit")
	health -= 30

func _physics_process(delta):
	velocity = direction.normalized() *80
	move_and_collide(velocity*delta)
	
# the basic health system on the progress bar 
var health: = 100:
	set(value):
		health = value
		progress_bar.value = value
		if value <=0:
			queue_free()

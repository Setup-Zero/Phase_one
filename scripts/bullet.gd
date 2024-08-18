extends Area2D

var distace = 0

@onready var animated_sprite_2d = $AnimatedSprite2D

	

func _physics_process(delta):

	const SPEED = 400
	const  RANGE = 500
	animated_sprite_2d.play("idle")
	var direction = Vector2.RIGHT.rotated(rotation)
	position += direction * SPEED * delta
	distace += SPEED*delta
	if distace > RANGE:
		queue_free()


func _on_body_entered(body):
	queue_free() 
	if body.has_method("take_dmg"):
		body.take_dmg()
		

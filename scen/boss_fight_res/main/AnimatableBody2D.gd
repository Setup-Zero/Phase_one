extends AnimatableBody2D

@onready var animat = $"../AnimationPlayer"


func _ready():
	animat.play("moving")
	
	
func take_dmg():
	pass

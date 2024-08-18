extends State

func _enter_tree():
	randomize()

func enter():
	super.enter()
	owner.set_physics_process(true)
	anime.play("idle")
	
func exit():
	super.exit()
	owner.set_physics_process(false)
	
func transition():
	if owner.direction.length() > 100:
		get_parent().change_state("bomb_atk")
	if owner.direction.length() > 490:
		var chance = randi()%2
		match chance:
			0:
				get_parent().change_state("shoot_atk")
			1:
				get_parent().change_state("follow")



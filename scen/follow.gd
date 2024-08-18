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
	if owner.direction.length() < 100:
		get_parent().change_state("meel")
	if owner.direction.length() > 490:
		var chance = randi()%2
		match chance:
			0:
				get_parent().change_state("shoot")
			1:
				get_parent().change_state("follow")

	if owner.direction.length() < 200:
		var chance = randi()%2
		match chance:
			0:
				get_parent().change_state("follow")
			1:
				get_parent().change_state("shoot_atk")


extends State

var can_transition: bool = false
func enter():
	super.enter()
	anime.play("teleport")
	await  anime.animation_finished
	can_transition =true
	
func teleport():
	owner.position = player.position + Vector2(5,5)*40

func transition():
	if can_transition:
		get_parent().change_state("atk")
		can_transition = false




extends State
@export var minion_node : PackedScene
var can_transition: bool = false

func enter():
	super.enter()
	anime.play("summon")
	await anime.animation_finished
	can_transition=true
	
func spawn():
	var minion = minion_node.instantiate()
	minion.position = owner.position + Vector2.DOWN
	get_tree().current_scene.add_child(minion)
func transition():
	if can_transition:
		get_parent().change_state("follow")

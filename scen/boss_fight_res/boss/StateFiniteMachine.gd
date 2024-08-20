extends Node2D


var current_state : State
var previous_state : State

func _ready():
	current_state = get_child(0) as State
	previous_state = current_state
	current_state.enter()
	
	
	
func change_state(state):
	if state == previous_state.name:
		return
	
	match state:
		'follow':
			$"../AnimationPlayer".play('boss_follow')
		'shoot_atk':
			$"../AnimationPlayer".play('boss_follow')
		'bomb_atk':
			$"../AnimationPlayer".play('boss_throw')
	
	current_state = find_child(state) as State
	current_state.enter()
	
	previous_state.exit() 
	previous_state = current_state

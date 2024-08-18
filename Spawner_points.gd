extends Node2D
@export var enemy_spawner_node = preload("res://scen/enemy.tscn")
var spawn_enemies := []

@onready var main = get_tree().get_first_node_in_group("main")

@onready var timer = $Timer



var enemy_count = 3

var can_spawn : bool = true
func _process(delta):

			for i in get_children():
				if i is Marker2D:
					spawn_enemies.append(i)
	#else :
		#timer.is_stopped()
		

func _on_timer_timeout():
	
		var spawn = spawn_enemies[randi()% spawn_enemies.size()]
		var enemy = enemy_spawner_node.instantiate()
		enemy.position = spawn.position
		main.add_child(enemy)
	


extends Node2D
@export var enemy = preload("res://scen/enemy.tscn")
var spawn_enemies := []

@onready var main = get_tree().get_first_node_in_group("main")
@onready var next_wave = $Node2D/ui/next_wave

@onready var timer = $Timer



var enemy_count = 3

var can_spawn : bool = true
func _process(delta):
	if Global.wave_cont ==5:
		wave_check()
			#for i in get_children():
			#	if i is Marker2D:
			#		spawn_enemies.append(i)
	#else :
		#timer.is_stopped()
		

func wave_check():
	timer.stop()
	timer.set_wait_time(2)
	next_wave.visible = true
	timer.start()

func _on_timer_timeout():
	next_wave.visible = false
		#var spawn = spawn_enemies[randi()% spawn_enemies.size()]
		#var enemy = enemy_spawner_node.instantiate()
		#enemy.position = spawn.position
		#main.add_child(enemy)
	var enemy_instance = enemy.instantiate()
	add_child(enemy_instance)
	enemy_instance.position=$Marker2D.position
	
	
	var nodes = get_tree().get_nodes_in_group("spawn")
	var node = nodes[randi()% nodes.size()]
	var position = node.position
	%Marker2D.position = position
	


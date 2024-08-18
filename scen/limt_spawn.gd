extends Node2D
var _spawn_peed: float = 1.0 / 3.0 # 1 enemy every 3 seconds
								 # in your case
var can_spawm = true
var _spawns_quantity: float  # For tracking the quantity
							# to spawn over time
var enemyPath = preload("res://scen/enemy.tscn")
func _process(delta: float):

	# Increase spawns quantity over time
	_spawns_quantity += delta * _spawn_peed

	# Check if something to spawn
	if _spawns_quantity >= 1:
		can_spawm = true
		var spawns_count: float = floor(_spawns_quantity)
		_spawns_quantity -= spawns_count
		for index in int(spawns_count):
			spawn()
	if len(_spawns_quantity) <5:
		_spawn_peed = 0
func spawn():
	randomize()
	var random_x = randi_range(50,300)
	$Marker2D.position.x = random_x
	$Marker2D.position.y = 0
	
	var enemy = enemyPath.instantiate()
	add_child(enemy)
	enemy.position = $Marker2D.position

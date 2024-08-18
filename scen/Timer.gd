extends Timer
var slime = preload("res://scen/enemy.tscn")
var count = 0

func _on_Timer_timeout():
	if count < 5:
		slime.Timer.one_shot()

func _on_Slime_enemy_killed():
	print ("killed")

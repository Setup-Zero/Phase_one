extends Control




func _on_enter_pressed():
	get_tree().change_scene_to_file("res://scen/main.tscn")


func _on_options_pressed():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().quit()

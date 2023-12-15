extends Menu_Operations

func _on_quit_pressed():
	quit()
	
func _on_try_again_pressed():
	change_scene("res://scenes/world.tscn")

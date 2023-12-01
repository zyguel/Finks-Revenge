extends Menu_Operations

func _on_quit_pressed():
	quit()
	
func _on_try_again_pressed():
	Global.health = Global.MAX_HEALTH
	change_scene("res://scenes/world.tscn")

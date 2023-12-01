extends Menu_Operations


func _on_play_game_pressed():
	Global.health = Global.MAX_HEALTH
	change_scene("res://scenes/world.tscn")


func _on_quit_game_pressed():
	quit()

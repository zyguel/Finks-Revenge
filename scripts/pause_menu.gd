extends Menu_Operations

@onready var main = $"../../"

func _on_resume_pressed():
	main.pauseMenu()


func _on_quit_pressed():
	quit()


func _on_restart_pressed():
	reset_pause()
	reload()

func _on_main_menu_pressed():
	reset_pause()
	change_scene("res://scenes/main_menu.tscn")
	
func reset_pause():
	Global.paused = !Global.paused
	Engine.time_scale = 1	

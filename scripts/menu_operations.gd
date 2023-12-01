extends Node

class_name Menu_Operations

func quit():
	get_tree().quit()

func change_scene(location):
	get_tree().change_scene_to_file(location)
	
func reload():
	get_tree().reload_current_scene()
	
func restart():
	pass

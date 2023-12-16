extends Node

@onready var sad = $sad

func _ready():
	Globaltheme.stop()
	sad.play()
	
func _on_quit_pressed():
	get_tree().quit()
	
func _on_try_again_pressed():
	Global.resetvariables()
	Globaltheme.play()
	
	get_tree().change_scene_to_file("res://scenes/game.tscn")

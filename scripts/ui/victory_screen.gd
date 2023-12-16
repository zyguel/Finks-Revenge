extends Node

class_name VictoryScreen

@onready var win = $win
@onready var transition = $transition
@onready var flag = $Flag
func _ready():
	Globaltheme.stop()
	transition.play("fadein")
	win.play()


func _on_retrybutton_pressed():
	Globaltheme.play()
	Global.resetvariables()
	get_tree().change_scene_to_packed(Global.game)
	


func _on_menubutton_pressed():
	get_tree().change_scene_to_packed(Global.menu)


func _on_quitbutton_pressed():
	get_tree().quit()

extends Node

@onready var hover = $hover
@onready var pressed = $press
@onready var theme = $theme


func _ready():
	Globaltheme.play()

func _on_play_game_pressed():
	pressed.play()
	await pressed.finished
	get_tree().change_scene_to_packed(Global.game)

func _on_quit_game_pressed():
	get_tree().quit()

func _on_play_game_mouse_entered():
	hover.play()

func _on_quit_game_mouse_entered():
	hover.play()

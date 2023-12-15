extends Menu_Operations

@onready var hover = $hover
@onready var pressed = $press
@onready var theme = $theme


func _on_play_game_pressed():
	pressed.play()
	await pressed.finished
	change_scene("res://scenes/world.tscn")


func _on_quit_game_pressed():
	quit()


func _on_play_game_mouse_entered():
	hover.play()


func _on_quit_game_mouse_entered():
	hover.play()

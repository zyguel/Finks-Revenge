extends Node

var MAX_HEALTH = 3
var health
var score
var paused = false

func player_damage():
	health -= 1
	if health < 0:
		get_tree().change_scene_to_file("res://scenes/death_screen.tscn")

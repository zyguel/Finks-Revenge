extends Node

@onready var menu = preload("res://scenes/screen/main_menu.tscn")
@onready var victory = preload("res://scenes/screen/victory_screen.tscn")
@onready var death = preload("res://scenes/screen/death_screen.tscn")
@onready var game = load("res://scenes/game.tscn")

const MAX_HEALTH = 3
var spawnpoint := Vector2(0,0)
var points = 0
var health = 3
			
func damage():
	if(health > 1):
		health -= 1
	else:
		get_tree().change_scene_to_packed(death)

func addhealth():
	if(health < MAX_HEALTH):
		health += 1
	else:
		addpoints()

func addpoints():
	points += 1

func resetvariables():
	health = MAX_HEALTH
	points = 0


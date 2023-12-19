extends Node2D

class_name Game

@onready var player = $Map/Player
@onready var spawn = $SpawnPoint
@onready var checkpoint = $Map/Checkpoint
@onready var transition = $transition
@onready var textmute = $Mute/Panel/Button/TextureRect
var mute = false

func _ready():
	Global.spawnpoint = player.global_position

func _process(_delta):
	if checkpoint.activated:
		get_tree().change_scene_to_packed(Global.victory)



func _on_button_pressed():
	if mute:
		Globaltheme.stream_paused = false
		textmute.texture = load("res://assets/menu/unmute.svg")
	else:
		Globaltheme.stream_paused = true
		textmute.texture = load("res://assets/menu/mute.svg")
	
	mute = !mute

extends Node2D

class_name Game

@onready var player = $Map/Player
@onready var spawn = $SpawnPoint
@onready var checkpoint = $Map/Checkpoint
@onready var transition = $transition


func _ready():
	Global.spawnpoint = player.global_position

func _process(_delta):
	if checkpoint.activated:
		get_tree().change_scene_to_packed(Global.victory)


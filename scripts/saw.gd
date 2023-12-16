extends Area2D

class_name Saw

@onready var saw = $saw

func _ready():
	$SawSprite.play("default")

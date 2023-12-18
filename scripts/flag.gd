extends Node2D

class_name Checkpoint

@onready var sprite = $flag
var activated = false

func _ready():
	sprite.play("idle")

func _on_area_body_entered(body):
	if body is Player && !activated:
		activated = true

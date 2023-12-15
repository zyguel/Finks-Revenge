extends Node2D
class_name Checkpoint

@onready var sprite = $flag
@onready var win = $win

var activated = false

func _on_area_body_entered(body):
	if body is Player && !activated:
		activated = true
		sprite.play("contact")
		win.play()
		await sprite.animation_finished
		sprite.play("idle")

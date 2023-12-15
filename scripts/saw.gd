extends Area2D

class_name Saw

@onready var saw = $saw

func _ready():
	$SawSprite.play("default")

func _on_areaisze_body_entered(body):
	if body is Player:
		saw.play()


func _on_areaisze_body_exited(body):
	saw.stop()

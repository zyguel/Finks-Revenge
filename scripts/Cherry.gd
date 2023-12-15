extends Node2D

class_name Cherry

@onready var sprite = $"sprite"
@onready var collected = $collected

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("cherry")

func _on_area_body_body_entered(body):
	if body is Player:
		sprite.play("collected")
		collected.play()
		await sprite.animation_finished
		queue_free()

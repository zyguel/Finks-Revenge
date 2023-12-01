extends Node2D

@onready var sprite = $"Cherry Sprite"

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("cherry")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func _on_cherry_body_body_entered(body):
	if body.name == "Player":
		if Global.health != 3:
			Global.health += 1
		sprite.play("collected")
		await sprite.animation_finished
		self.queue_free()

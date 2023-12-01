extends Node2D

@onready var sprite = $Bananasprite
# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("banana")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_banana_body_body_entered(body):
	if body.name == "Player":
		sprite.play("collected")
		await sprite.animation_finished
		self.queue_free()

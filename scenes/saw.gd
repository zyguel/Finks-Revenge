extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$SawSprite.play("default")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Rework needed
func _on_body_entered(body):
	if body.name == "Player":
		get_tree().reload_current_scene()
		Global.player_damage()	

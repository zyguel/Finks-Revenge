extends Node2D



func _on_finish_line_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://scenes/node.tscn")

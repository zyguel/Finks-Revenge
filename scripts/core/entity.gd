extends CharacterBody2D

class_name Entity

#Variables
@export var SPEED : float
@export var JUMP_VELOCITY : float
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func flip(sprite, condition):
	if condition:
		sprite.flip_h = true
	else:
		sprite.flip_h = false	



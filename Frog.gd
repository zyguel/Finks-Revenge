extends CharacterBody2D

# Scenes
@onready var sprite = $frogSprite
@onready var facing = $frogDirection
@onready var onFloor = $frogFloor

# Signal
signal player_detected

# Variables
var SPEED = 150.0
var is_facing_right = true;

# Gravity
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	sprite.play("run")
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if facing.is_colliding() or (!onFloor.is_colliding() and is_on_floor()):
		SPEED = -SPEED
		flip()
	
	if velocity.x > 0:
		facing.rotation_degrees = 0
		onFloor.position.x = 10
	else:
		facing.rotation_degrees = 180
		onFloor.position.x = -10
	
	velocity.x = SPEED
	

	move_and_slide()

		
func flip():
	if is_facing_right:
#		facing.rotation_degrees = 0
		sprite.flip_h = true
	else:
#		facing.rotation_degrees = 180
		sprite.flip_h = false	
	is_facing_right = !is_facing_right
	


# Functions that checks if the player has entered the area of the player
func _on_frog_hitbox_body_entered(body):
	if body.name == "Player":
		death_ani()

# Rework needed
func _on_frog_attack_body_entered(body):
	if body.name == "Player":
		Global.player_damage()	
		death_ani()

func death_ani():
	SPEED = 0
	sprite.play("hit")
	await sprite.animation_finished
	queue_free()

extends Entity

class_name Enemy

@onready var sprite = $sprite
@onready var facing = $frogDirection
@onready var onFloor = $frogFloor
@onready var death = $death
var is_facing_right = true

func _ready():
	sprite.play("run")
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if facing.is_colliding() or (!onFloor.is_colliding() and is_on_floor()):
		SPEED = -SPEED
		flip(sprite, is_facing_right)
		is_facing_right = !is_facing_right

	if velocity.x > 0:
		facing.rotation_degrees = 0
		onFloor.position.x = 10
	else:
		facing.rotation_degrees = 180
		onFloor.position.x = -10
	
	velocity.x = SPEED
	
	move_and_slide()


# Functions that checks if the player has entered the area of the player
func _on_frog_hitbox_body_entered(body):
	if body is Player:
		Global.addpoints()
		death_ani()

# Rework needed
func _on_frog_attack_body_entered(body):
	if body is Player:
		body.velocity.y = JUMP_VELOCITY
		body.die()
		death_ani()

func death_ani():
	SPEED = 0
	velocity.y = JUMP_VELOCITY
	
	set_collision_mask_value(1, false)
	set_collision_layer_value(2, false)
	$hitboxArea.queue_free()
	$attackArea.queue_free()
	$body.queue_free()

	sprite.play("hit")
	death.play()
	await sprite.animation_finished
	queue_free()

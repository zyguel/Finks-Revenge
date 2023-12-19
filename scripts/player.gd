extends Entity

class_name Player

@onready var sprite = $sprite
@onready var death = $playerdeath
@onready var body = $body
@onready var hitbox = $hitboxArea
@onready var playerscreen = $onscreen
@onready var camera = $Camera2D
@export var player_input : bool = true

func _ready():
	sprite.play("idle")
	
func _physics_process(delta):
	move_and_slide()
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if player_input:
		# Flips where character is facing
		if velocity.x > 1 or velocity.x < -1:
			sprite.play("run")
		else:
			sprite.play("idle")

		# Handle Jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		var direction = Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		update_animation()
		
	
func update_animation():
	# Jumping animation
	if velocity.y < 0:
		sprite.play("jump")
	elif velocity.y > 0:
		sprite.play("fall")
		
	# Direction Facing
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0:
		sprite.flip_h = false

func _on_hitbox_area_area_entered(area):
	if area is Saw:
		player_input = false
		set_collision_mask_value(1, false)
		set_collision_mask_value(2, false)
		set_collision_layer_value(1, false)
		hitbox.set_collision_mask_value(1, false)
		body.disabled = true
		velocity.y = JUMP_VELOCITY
		
		#Animation
		sprite.play("hit")
		death.play()
		

func _on_onscreen_screen_exited():
	if playerscreen.is_on_screen() == false:
		Global.damage()
		position = Global.spawnpoint
		sprite.play("hit")
		player_input = true
		set_collision_mask_value(1, true)
		set_collision_layer_value(1, true)
		hitbox.set_collision_mask_value(1, true)
		body.disabled = false

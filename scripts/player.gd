extends Entity

class_name Player

@onready var sprite = $"sprite"
@onready var death = $playerdeath

func _ready():
	sprite.play("idle")
	
func _process(_delta):
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
func _physics_process(delta):
	# Flips where character is facing
	if velocity.x > 1 or velocity.x < -1:
		sprite.play("run")
	else:
		sprite.play("idle")
		
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

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
	move_and_slide()
	
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

func _on_hitboxArea_area_entered(area):
	if area is Saw:
		print("detected")
		death.play()
		sprite.play("hit")
		await sprite.animation



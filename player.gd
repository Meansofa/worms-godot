extends CharacterBody2D


const SPEED = 150.0
const JUMP_VELOCITY = -400.0

@export var player_animation : AnimatedSprite2D
@export var weapon_holder : Node2D
@export var projectile_scene : PackedScene

func _input(event):
	if event is InputEventKey:
		if Input.is_action_just_pressed("fire"):
			weapon_holder.fire()
			player_animation.play("throw")
			
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		player_animation.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	

func _process(_delta):
	_animation()

func fire():
	var projectile = projectile_scene.instantiate()
	get_parent().add_child(projectile)
	projectile.global_position = global_position
	#projectile.rotation = projectile.rotation_degrees  # Or use node.rotation
	var direction = Vector2.RIGHT.rotated(projectile.rotation)
	projectile.velocity = direction * 20

func _animation():
	if is_on_floor():
		if velocity.x != 0:
			player_animation.play("walking")
		else:
			player_animation.play("default")

	if weapon_holder.global_rotation_degrees > -90 && weapon_holder.global_rotation_degrees < 90:
		weapon_holder.scale.y = 1
		player_animation.flip_h = false
	else:
		weapon_holder.scale.y = -1
		player_animation.flip_h = true

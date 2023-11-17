extends CharacterBody2D

const SPEED = 0.1
@export var player_trail : PackedScene

# TODO: Create "dash" ability for keyboard controls

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if Input.is_action_just_pressed("toggle_mouse_control"):
		Globals.mouse_control = !Globals.mouse_control
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		rotate(direction * SPEED)
		
	if Globals.mouse_control:
		look_at(get_global_mouse_position())
	add_trail()
		
func add_trail():
	var trail = player_trail.instantiate()
	trail.set_properties(fmod(rotation, 2 * PI))
	owner.get_child(0).add_child(trail)

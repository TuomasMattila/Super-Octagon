extends CharacterBody2D

const SPEED = 0.1
const DASH_SPEED = 4
var dashing = false
var dash_start_angle = 0.0
var dash_end_angle = 0.0
var dash_time = 0.0
var dash_cooldown = 0.3
var direction = 0.0
@export var player_trail : PackedScene

func _physics_process(delta):
	
	if dash_cooldown < 0.3:
		dash_cooldown += delta
		if dash_cooldown >= 0.3:
			dash_cooldown = 0.3
		
	if Globals.mouse_control:
		look_at(get_global_mouse_position())
	else:
		if (Input.is_action_just_pressed("dash_left") or
		Input.is_action_just_pressed("dash_right")) and dash_cooldown == 0.3:
			dashing = true
			dash_cooldown = 0.0
			dash_start_angle = rotation
			dash_time = 0.0
			if Input.is_action_just_pressed("dash_left"):
				dash_end_angle = rotation + PI
			else:
				dash_end_angle = rotation - PI
		
		if dashing:
			rotation = lerp_angle(dash_start_angle,
									dash_end_angle,
									ease(dash_time, 0.5))
			dash_time += delta * DASH_SPEED
			if dash_time >= 1.0:
				dashing = false
				dash_time = 0.0
		else:
			direction = Input.get_axis("ui_left", "ui_right")
			if direction:
				rotate(direction * SPEED)
		
	add_trail()
		
func add_trail():
	var trail = player_trail.instantiate()
	trail.set_properties(fmod(rotation, 2 * PI))
	owner.get_child(0).add_child(trail)

extends Node2D

var time = 0.0
var change_timer = 4.0
var rng = RandomNumberGenerator.new()
var rotation_speed = 0.3

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	change_timer -= delta
	if change_timer <= 0.0:
		change_timer = rng.randf_range(3.0, 10.0)
		rotation_speed = rng.randf_range(-0.6, 0.6)
	rotate(rotation_speed * delta)
	skew = 0.2 * sin(time)

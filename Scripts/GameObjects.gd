extends Node2D

var time = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	# TODO: Change rotation direction and speed randomly
	rotate(0.3 * delta)
	skew = 0.2 * sin(time)

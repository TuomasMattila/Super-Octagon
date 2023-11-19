extends Polygon2D


# Called when the node enters the scene tree for the first time.
func _ready():
	ghosting()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func ghosting():
	var tween_fade = get_tree().create_tween()
	tween_fade.set_parallel(true)
	tween_fade.tween_property(self, "self_modulate", Color(0, 0, 0, 0), 0.75)
	tween_fade.tween_property(self, "scale", Vector2(0.2, 0.2), 1.5)
	await tween_fade.finished
	queue_free()

func set_properties(rot):
	rotation = fmod(rot, 2 * PI)
	

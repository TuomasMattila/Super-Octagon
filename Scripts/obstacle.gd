extends Node2D

var rng = RandomNumberGenerator.new()
var speed = 2.0

# TODO: Prevent impossible situations by restricting obstacle features over time
# - 7-part obstacles with opening on the opposing sides should not be possible at some point

# TODO: Make obstacles change color over time

# Called when the node enters the scene tree for the first time.
func _ready():
	var child_nodes = get_children()
	var how_many_to_remove = rng.randi_range(1, 7)
	var removed = []
	
	for i in how_many_to_remove:
		var roll = true
		var to_be_deleted = null
		while roll:
			to_be_deleted = rng.randi_range(0, 7)
			if to_be_deleted not in removed:
				removed.append(to_be_deleted)
				remove_child(child_nodes[to_be_deleted])
				roll = false
		
	apply_scale(Vector2(12.0, 12.0))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	speed = Globals.obstacle_speed
	scale.x -= speed * delta
	scale.y -= speed * delta
	if scale.x < 1:
		# Increase obstacle speed
		if Globals.obstacle_speed < Globals.max_speed:
			Globals.obstacle_speed += Globals.speed_acceleration
		# Decrease minimum obstacle spawn time
		if Globals.min_obstacle_spawn_time > Globals.smallest_obstacle_spawn_time:
			Globals.min_obstacle_spawn_time -= Globals.spawn_time_acceleration
		# Player gains a point if game is not over yet
		if Globals.in_game:
			Globals.score += 1
			get_tree().call_group("game", "update_score")
		queue_free()

func _on_area_2d_body_entered(body):
	if Globals.in_game:
		Globals.in_game = false
		body.get_node("DeathSound").play()
		get_tree().call_group("game", "show_game_over_label")
		body.get_node("GPUParticles2D").emitting = true
		body.get_node("Polygon2D").visible = false

extends Node2D

var rng = RandomNumberGenerator.new()
var speed = 2.0

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
		if Globals.obstacle_speed < 9.0:
			Globals.obstacle_speed += 0.1
		# Decrease minimum obstacle spawn time
		if Globals.min_obstacle_spawn_time > 0.4:
			Globals.min_obstacle_spawn_time -= 0.02
		# Player gains a point if game is not over yet
		if Globals.in_game:
			Globals.score += 1
			get_tree().call_group("main", "update_score")
		queue_free()

func _on_area_2d_body_entered(body):
	Globals.in_game = false
	get_tree().call_group("main", "show_game_over_label")
	body.queue_free()

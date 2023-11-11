extends Node2D

var obstacle = preload("res://Scenes/obstacle.tscn")
var time_until_spawn = 2.0
var rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time_until_spawn -= delta
	if time_until_spawn < 0:
		var obs = obstacle.instantiate()
		owner.find_child("GameObjects").add_child(obs)
		obs.position = position
		time_until_spawn = rng.randf_range(Globals.min_obstacle_spawn_time, 2.0)
		print("Min spawn time: " + str(Globals.min_obstacle_spawn_time) + " Speed: " + str(Globals.obstacle_speed))

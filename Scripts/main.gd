extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Pause game
	if Input.is_action_just_pressed("ui_cancel"):
		get_node("GameObjects").get_tree().paused = !get_node("GameObjects").get_tree().paused
		if get_node("GameObjects").get_tree().paused:
			get_node("UIElements/PauseScreen").show()
		else:
			get_node("UIElements/PauseScreen").hide()
			
	# Restarting game
	if Input.is_action_pressed("ui_accept"):
		Globals.in_game = true
		Globals.score = 0
		Globals.obstacle_speed = 2.0
		Globals.min_obstacle_spawn_time = 1.0
		get_tree().reload_current_scene()
	
func update_score():
	$UIElements/ScoreLabel.text = "Score: " + str(Globals.score)

func show_game_over_label():
	$UIElements/GameOverLabel.show()

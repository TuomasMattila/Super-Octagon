extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Pause game
	if Globals.in_game and Input.is_action_just_pressed("ui_cancel"):
		get_node("GameObjects").get_tree().paused = !get_node("GameObjects").get_tree().paused
		if get_node("GameObjects").get_tree().paused:
			get_node("UIElements/PauseScreen").show()
		else:
			get_node("UIElements/PauseScreen").hide()
			
	# Restarting game
	if !Globals.in_game and Input.is_action_pressed("ui_accept"):
		reset_variables()
		get_tree().reload_current_scene()
	
	# Go back to main menu
	if !Globals.in_game and Input.is_action_pressed("ui_cancel"):
		reset_variables()
		get_tree().change_scene_to_file(Globals.SCENE_MAIN_MENU)
		
func reset_variables():
	Globals.in_game = true
	Globals.score = 0
	Globals.obstacle_speed = 2.0
	Globals.min_obstacle_spawn_time = 1.0
	
func update_score():
	$UIElements/ScoreLabel.text = "Score: " + str(Globals.score)

func show_game_over_label():
	$UIElements/GameOverLabel.show()

func _on_quit_to_main_menu_button_pressed():
	get_node("GameObjects").get_tree().paused = false
	reset_variables()
	get_tree().change_scene_to_file(Globals.SCENE_MAIN_MENU)


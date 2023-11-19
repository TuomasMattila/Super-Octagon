extends Control

# TODO: Toggle fullscreen functionality
func _ready():
	# TODO: This is a temporary workaround
	Globals.mouse_control = false
	$TransitionScreen.fade_out()

func _on_start_button_pressed():
	$TransitionScreen.fade_in()

func _on_quit_button_pressed():
	get_tree().quit()

func _on_keyboard_control_check_box_toggled(button_pressed):
	Globals.mouse_control = false

func _on_mouse_control_toggled(button_pressed):
	Globals.mouse_control = true

func _on_transition_screen_transitioned():
	get_tree().change_scene_to_file(Globals.SCENE_GAME)

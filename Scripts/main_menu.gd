extends Control

# TODO: Toggle fullscreen functionality

# TODO: Separate "game modes" for arrow and mouse controls (checkbuttons or two start buttons)

func _on_start_button_pressed():
	get_tree().change_scene_to_file(Globals.SCENE_GAME)

func _on_quit_button_pressed():
	get_tree().quit()


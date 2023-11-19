extends CanvasLayer

signal transitioned

func fade_in():
	$ColorRect.visible = true
	$AnimationPlayer.play("fade_in")
	
func fade_out():
	$ColorRect.visible = true
	$AnimationPlayer.play("fade_out")
	
func flash():
	$ColorRect.visible = true
	$AnimationPlayer.play("flash")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "fade_in":
		emit_signal("transitioned")
	

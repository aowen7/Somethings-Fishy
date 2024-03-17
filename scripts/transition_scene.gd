extends CanvasLayer

signal transitioned

func transition():
	$AnimationPlayer.play("FadeToBlack")
	


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "FadeToBlack":
		emit_signal("transitioned")
		$AnimationPlayer.play("FadeFromBlack")
	
		

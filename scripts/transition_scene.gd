extends CanvasLayer

signal transitioned

func _ready():
	transition()

func transition():
	$AnimationPlayer.play("FadeToBlack")
	
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "FadeToBlack":
		$AnimationPlayer.play("FadeFromBlack")
	
	elif anim_name == "FadeFromBlack":
		emit_signal("transitioned")
		
		

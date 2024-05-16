extends CanvasLayer

signal transitioned

func _ready():
	$MainGame.visible = false
	$Interior.visible = false
	transition()

func transition():
	$AnimationPlayer.play("FadeToBlack")
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "FadeToBlack":
		$AnimationPlayer.play("FadeFromBlack")
		$StartMenu.visible = false
		$MainGame.visible = true
		$Interior.visible = true
	elif anim_name == "FadeFromBlack":
		emit_signal("transitioned")
		

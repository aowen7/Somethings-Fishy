extends Node

const MainScene = preload("res://scenes/world.tscn")
 

func _process(delta):
	if Input.is_action_just_pressed("click"):
		$TransitionScene.transition() 
		#$TransitionScene._on_animation_player_animation_finished(anim_name)
		

func _on_transition_scene_transitioned():
	#$TransitionScene._on_animation_player_animation_finished(anim_name)
	$Node2D/StartMenu.get_child(0).queue_free()
	#$StartMenuScene.add_child(MainScene.instantiate())
	get_tree().change_scene_to_file("res://scenes/world.tscn")

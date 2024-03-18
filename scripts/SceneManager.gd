extends Node

const MainScene = preload("res://scenes/world.tscn")

func _process(delta):
	if Input.is_action_just_pressed("click"):
		$TransitionScene.transition()
		

func _on_transition_scene_transitioned():
	get_tree().change_scene_to_file("res://scenes/world.tscn")
	#$StartMenuScene.get_child(0).queue_free()
	#$StartMenuScene.add_child(MainScene.instantiate())
	
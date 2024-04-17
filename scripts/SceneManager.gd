extends Node


const MainScene = preload("res://scenes/world.tscn")
#const CutScene = preload("res://scenes/cutscene.tscn")


func _ready():
	$TransitionScene.transition() 
		

func _on_transition_scene_transitioned():
	get_tree().change_scene_to_file("res://scenes/world.tscn")


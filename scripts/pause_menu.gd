extends Control

@onready var world = $".."

func _on_resume_pressed():
	world.PauseMenu()
	

func _on_quit_pressed():
	get_tree().quit()

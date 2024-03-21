extends Control
signal paused

@onready var main = "res://scenes/world.tscn"
	

func _on_quit_pressed():
	get_tree().quit()


#func _on_pause_pressed():
	#main.PauseMenu()

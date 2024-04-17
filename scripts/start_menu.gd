class_name StartMenu

extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton
@onready var quit_button = $MarginContainer/HBoxContainer/VBoxContainer/QuitButton

@onready var opening_waves = $MusicPack/openingwavesx

func _onready():
	opening_waves.play()
	
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://cutscene.tscn")
	opening_waves.stop()

func _on_quit_button_pressed():
	get_tree().quit()

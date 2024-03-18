class_name StartMenu

extends Control

@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton
@onready var quit_button = $MarginContainer/HBoxContainer/VBoxContainer/QuitButton
@onready var scene_manager = $"."


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://scenes/scene_manager.tscn")


func _on_quit_button_pressed():
	get_tree().quit()


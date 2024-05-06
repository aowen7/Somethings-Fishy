extends Node2D


@onready var world = $"."
@onready var pause_menu = $PauseMenu
#@export var possibleItems :Array[MenuItem]

#@export var current_items : Array[int]

var paused = false

#func _process(delta):
	#for i in possibleItems:
		#if i._does_match(current_items):
			#print("found a match")
			
	#if Input.is_action_just_pressed("pause"):
		#PauseMenu()
	
func PauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
		
	paused = !paused

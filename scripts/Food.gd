extends Node2D

# Variables to store references to items
@onready var rice_2 = $Rice2
@onready var egg_2 = $Egg2

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos : Vector2

func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = get_global_mouse_position() - offset
		elif Input.is_action_just_released("click"):
			global.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				tween.tween_property(self,"position",body_ref.position,0.2).set_ease(Tween.EASE_OUT)
			else:
				tween.tween_property(self,"global_position",initialPos,0.2).set_ease(Tween.EASE_OUT)

#Combining System

  # Check for collision between items
	if rice_2 != $Rice2 and egg_2 != $Egg2 and rice_2.global_position.distance_to(egg_2.global_position) < 10:
		combineItems()

func _on_area_2d_mouse_entered():
	if not global.is_dragging:
		draggable = true
		#scale = Vector2(1.05, 1.05)

func _on_area_2d_mouse_exited():
	if not global.is_dragging:
		draggable = false
		#scale = Vector2(1,1)

func _on_area_2d_body_entered(body:StaticBody2D):
	if body.is_in_group('dropable'):
		is_inside_dropable = true
		body.modulate = Color(Color.REBECCA_PURPLE, 1)
		body_ref = body 

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		is_inside_dropable = false
		body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
	

#Combining System Continuted

# Function to combine items
func combineItems():
	# Get positions of the items
	var posA = rice_2.global_position
	var posB = egg_2.global_position
	
	# Remove items from the scene
	rice_2.queue_free()
	egg_2.queue_free()
	
	# Instantiate a new item in their place (example)
	var rice_and_egg = $"."
	
	rice_and_egg.instance()
	add_child(rice_and_egg)
	rice_and_egg.global_position = (posA + posB) / 2
	
	# Reset references
	rice_2 = null
	egg_2 = null

# Signal handler for when ItemA is collided
func _on_ItemACollision(body):
	if body.name == "rice_2":
		rice_2 = body

# Signal handler for when ItemB is collided
func _on_ItemBCollision(body):
	if body.name == "egg_2":
		egg_2 = body

extends Node2D

@onready var pause_menu = $"PauseMenu"

var customer_scene = preload("res://scenes/customer.tscn")

var paused = false

func _ready():
	$Timer.start()
	spawn_customer()
	
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("pause"):
		PauseMenu()

func spawn_customer():
	print("Spawning customer")
	# Instantiate a new customer and add it to the scene
	var customer_instance = customer_scene.instantiate() # Correct way to instance the scene
	if customer_instance != null:
		# Set the position of the customer
		customer_instance.position = Vector2(500, 500)  # Example position
		# Set the Z-index of the customer
		customer_instance.z_index = -1 # Adjust the Z-index as needed
		add_child(customer_instance)
	else:
		print("Failed to instance customer scene")

func PauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0

	paused = !paused

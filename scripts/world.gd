extends Node2D

@onready var pause_menu = $"PauseMenu"
@onready var customer_slot_one = $CustomerSlotOne

var customer_scene = preload("res://scenes/customer.tscn")

var paused = false

func _ready():
	# Start timer for initial customer spawn
	$Timer.start()
	spawn_customer()
	print("Customer scene:", customer_scene)  # Print the customer scene path

func _process(delta):
		$Timer.start()

func _input(event):
	if event.is_action_pressed("pause"):
		PauseMenu()

func spawn_customer():
	print("Spawning customer")
	# Instantiate a new customer and add it to the scene
	var customer_instance = customer_scene.instantiate()  # Correct way to instance the scene
	if customer_instance != null:
		# Set the position of the customer
		customer_instance.position = Vector2(-80, 250)  # Example position
		# Set the Z-index of the customer
		customer_instance.z_index = -3  # Adjust the Z-index as needed
		print("Customer position:", customer_instance.position)  # Debugging: Print customer position
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

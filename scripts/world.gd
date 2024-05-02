extends Node2D

@onready var pause_menu = $"PauseMenu"
@onready var customer_slot_one = $CustomerSlotOne

const CUSTOMER_DELAY = 5  # Delay between customer spawns (in seconds)
var customer_spawn_timer: float = CUSTOMER_DELAY  # Timer for customer spawn

var customer_scene = preload("res://scenes/customer.tscn")
var customer_instance = customer_scene.instance()

var paused = false

func _ready():
	# Start timer for initial customer spawn
	$Timer.start()
	
	print("Customer scene:", customer_scene)  # Print the customer scene path
	var customer_instance = customer_scene.instance()
	if customer_instance != null:
		add_child(customer_instance)
	else:
		print("Failed to instance customer scene")
	
func _on_Timer_timeout():
	print("Timer expired")
	spawn_customer()

func _process(delta):
	if customer_spawn_timer <= 0:
		spawn_customer()
		customer_spawn_timer = CUSTOMER_DELAY  # Reset timer
		$Timer.start()
	else:
		customer_spawn_timer -= delta

func _input(event):
	if event.is_action_pressed("pause"):
		PauseMenu()

func spawn_customer():
	print("Spawning customer")
	# Instantiate a new customer and add it to the scene
	var customer = customer_scene.instance()
	add_child(customer)

func PauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0

	paused = !paused

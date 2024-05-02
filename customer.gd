extends Node2D

@export var customer_sprites_list : Array[Texture2D]
@onready var customerSprite = $CustomerSprite
# Variables
@onready var current_state = CustomerState.IDLE
@onready var patience_timer = 60  # 60 seconds (1 minute)
var is_patience_running = false

# Called when the node enters the scene tree for the first time.
func _ready():
	customerSprite.texture = customer_sprites_list.pick_random()


# Customer States
enum CustomerState {
	IDLE,
	WALKING_TO_COUNTER,
	ORDERING,
	WAITING_FOR_FOOD,
	EATING,
	LEAVING
}

func set_state(new_state: CustomerState) -> void:
	current_state = new_state
	match current_state:
		CustomerState.IDLE:
			state_idle()
		CustomerState.ORDERING:
			state_ordering()
		CustomerState.WAITING_FOR_FOOD:
			state_waiting_for_food()
		CustomerState.EATING:
			state_eating()
		CustomerState.LEAVING:
			state_leaving()

# Example state transition functions
func state_idle() -> void:
	pass # Logic for when customer is idle

func state_ordering() -> void:
	# Logic for when customer is ordering
	var menu_items = ["Miso", "GreenTea", "TamagoSushi", "ShrimpNigiri", "SalmonNigiri", "TunaNigiri", "SalmonRoeSushi", "UniSushi"]
	var chosen_item = menu_items[randi() % menu_items.size()]
	print("Customer is ordering", chosen_item)
	# For simplicity, let's assume the customer waits for food after ordering
	set_state(CustomerState.WAITING_FOR_FOOD)

func state_waiting_for_food() -> void:
	# Start the patience countdown
	is_patience_running = true
	set_process(true)

	# Add any additional logic for when the customer is waiting for food
	print("Customer is waiting for food.")

# Called every frame while waiting for food.
func _process(delta):
	# Decrease the patience timer
	if is_patience_running:
		patience_timer -= delta
		if patience_timer <= 0:
			lose_patience()
			is_patience_running = false

# Handle what happens when the customer loses patience
func lose_patience():
	print("Customer lost patience!")
	# Add logic here for what happens when the customer loses patience,
	# such as leaving the restaurant or becoming angry
	set_state(CustomerState.LEAVING)

func state_eating() -> void:
	pass # Logic for when customer is eating

func state_leaving() -> void:
	pass # Logic for when customer is leaving

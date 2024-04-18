extends CanvasLayer

const CHAR_READ_RATE = 0.05



@onready var textbox_container = $TextboxContainer
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label
@onready var next_button = $NextButton


enum State {
	READY,
	READING,
	FINISHED
}

var current_state = State.READY
var text_queue = []
var current_text = ""
var text_index = 0
var time_accumulator = 0.0
var can_progress = false

func _ready():
	print("Starting state: State.READY")
	hide_textbox()
	queue_text("Wow! Finally, someone is going to do something with this run down hunk of-")
	queue_text("-Junk")
	queue_text("...")
	queue_text("Well... thank you for taking this old place off my hands, kid.")
	queue_text("I don't know what you're gonna do with it, and I don't wanna know.")
	queue_text("But, you must promise me one thing.")
	queue_text("Please keep this pigsty going. Your grandma built it from scratch.")
	queue_text("...")
	queue_text("Here, for being a good sport, take this LIFETIME SUPPLY OF EGGS!")
	queue_text("Use it however.")

func _process(delta):
	match current_state:
		State.READY:
			if text_queue.size() > 0:
				display_text()
		State.READING:
			time_accumulator += delta
			if time_accumulator >= CHAR_READ_RATE:
				time_accumulator -= CHAR_READ_RATE
				label.text = current_text.left(text_index)
				text_index += 1
				if text_index > current_text.length():
					end_symbol.text = "v"
					change_state(State.FINISHED)

func queue_text(next_text):
	text_queue.append(next_text)

func hide_textbox():
	start_symbol.text = ""
	end_symbol.text = ""
	label.text = ""
	textbox_container.hide()

func show_textbox():
	start_symbol.text = "*"
	textbox_container.show()

func display_text():
	if text_queue.size() > 0:
		current_text = text_queue.pop_front()
		label.text = current_text
		show_textbox()
		change_state(State.READING)
		print("Displaying text:", current_text)
	else:
		change_state(State.FINISHED)
		print("No more texts in the queue")

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
			next_button.show()
			can_progress = false
		State.READING:
			print("Changing state to: State.READING")
			next_button.hide()
			can_progress = false
		State.FINISHED:
			print("Changing state to: State.FINISHED")
			next_button.show()
			can_progress = false
			


func _on_next_button_pressed():
	if current_state == State.FINISHED:
		if text_queue.size() == 0: 
			get_tree().change_scene_to_file("res://scenes/transition_scene.tscn")
		else:
			display_text()
		

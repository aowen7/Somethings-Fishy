extends CanvasLayer

const CHAR_READ_RATE = 0.05

@onready var textbox_container = $TextboxContainer
@onready var start_symbol = $TextboxContainer/MarginContainer/HBoxContainer/Start
@onready var end_symbol = $TextboxContainer/MarginContainer/HBoxContainer/End
@onready var label = $TextboxContainer/MarginContainer/HBoxContainer/Label

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

func _ready():
	print("Starting state: State.READY")
	hide_textbox()
	queue_text("Excuse me wanderer where can I find the bathroom?")
	queue_text("Why do we not look like the others?")
	queue_text("Because we are free assets from opengameart!")
	queue_text("Thanks for watching!")

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
		State.FINISHED:
			pass

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
	text_index = 0
	time_accumulator = 0.0
	current_text = text_queue.pop_front()
	change_state(State.READING)
	show_textbox()

func change_state(next_state):
	current_state = next_state
	match current_state:
		State.READY:
			print("Changing state to: State.READY")
		State.READING:
			print("Changing state to: State.READING")
		State.FINISHED:
			print("Changing state to: State.FINISHED")

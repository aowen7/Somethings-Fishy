extends Control

var typing_speed = 0.1
var current_text = ""
var target_text = ""
var typing_timer

func _ready():
	typing_timer = Timer.new()
	add_child(typing_timer)
	typing_timer.connect("timeout", self, "_on_typing_timer.timeout")

func display_text(text: String):
	target_text = text
	current_text = ""
	typing_timer.start(typing_speed)

func _on_typing_timer_timeout(delta: float):
	if current_text.length() > target_text.length():
		current_text += target_text[current_text.length()]
		self.text = current_text
	else:
		typing_timer.stop()

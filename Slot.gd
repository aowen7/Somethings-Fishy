extends StaticBody2D

func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)

func _process(delta):
# the slot box is visible when item is being dragged and not visible when nothing is dragged
	if global.is_dragging:
		visible = true
	else:
		visible = false 

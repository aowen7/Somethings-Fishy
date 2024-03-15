extends CanvasLayer



func _ready():
	transition()

func transition():
	$StartToMainScreen/AnimationPlayer.play("FadeToBlack")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

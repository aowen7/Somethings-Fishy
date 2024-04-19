extends CanvasLayer

signal transitioned

@onready var outside = $Outside
@onready var grandpa = $Grandpa
@onready var interior = $interior
@onready var counter = $counter


func _ready():
	transition()

func transition():
	$AnimationPlayer.play("FadeToBlack")
	
func _on_animation_player_animation_finished(anim_name):
	if anim_name == "FadeToBlack":
		$AnimationPlayer.play("FadeFromBlack")
		grandpa.hide()
		outside.hide()
		$interior.visible = true
		$counter.visible = true
	
	elif anim_name == "FadeFromBlack":
		emit_signal("transitioned")
		get_tree().change_scene_to_file("res://scenes/world.tscn")
		
		
		

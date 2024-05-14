extends HBoxContainer

@onready var craft = $craft
@export var item: Item = null
@export var recipe = item.recipe

func _ready():
	craft.icon = item.icon
	
	for i in range(recipe.size()):
		get_child(i).item = recipe[1]

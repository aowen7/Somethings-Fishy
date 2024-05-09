extends Resource

class_name items

@export var icon: Texture2D
@export var name : String

@export var recipe: Array[items]


@export_enum("egg sushi", "ingredients")
var type = "ingredients"

@export_multiline var description: String

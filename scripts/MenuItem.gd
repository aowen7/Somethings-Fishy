extends Resource

@export var foods : Array[int]
#var salmon_sushi = Array[7,8]

func _init(foodItems = []):
	foods = foodItems
	salmon_sushi 
	
func _does_match(items:Array[int]) -> bool:
	for i in items:
		if not i in foods:
			return false
	for f in foods:
		if f not in items:
			return false
	return true

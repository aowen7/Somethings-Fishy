extends GridContainer

signal item_changed

#region testing

@export var Rice : Item
@export var Egg : Item
@export var Seaweed : Item

func _ready():
	await get_tree().create_timer(2).timeout
	add_item(Rice)
	await get_tree().create_timer(2).timeout
	add_item(Egg)
	await get_tree().create_timer(2).timeout
	add_item(Seaweed)
#endregion



func add_item(item):
	for i in get_children():
		if i.item == null:
			i.item = item
			item_changed.emit()
			return
			
func remove_item(item):
	for i in get_children():
		if i.item == item:
			i.item == null
			item_changed.emit()
			return
			
func is_available(item):
	for i in get_children():
		if i.item == item:
			return true
	return false

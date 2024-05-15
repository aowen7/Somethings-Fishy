extends VBoxContainer


func _on_inventory_item_changed():
	for recipe in get_children():
		recipe.check()

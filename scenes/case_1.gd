extends TextureRect


func _get_drag_data(position):
	var Case1 = $Label.text
	print(Case1)
	return Case1
	
func _can_drop_data(_pos, data):
	return true
	
func _drop_data(_pos, data):
	pass

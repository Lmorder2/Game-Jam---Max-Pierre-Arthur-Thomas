extends TextureRect

@export var canDrop = true

func _get_drag_data(position):
	# Get the text from the Label node in the scene
	var text_data = $Label.text

	# Create a new Label that will be shown while dragging
	var label = Label.new()
	label.text = text_data  # Set the text inside the new label
	label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER  # Center the text horizontally
	label.vertical_alignment = VERTICAL_ALIGNMENT_CENTER  # Center the text vertically
	label.size_flags_horizontal = Control.SIZE_SHRINK_CENTER  # Allow the label to shrink and center horizontally
	label.size_flags_vertical = Control.SIZE_SHRINK_CENTER  # Allow the label to shrink and center vertically

	# Create a container to hold the label (needed for correct positioning)
	var container = MarginContainer.new()
	container.add_child(label)  # Put the label inside the container

	# Wait for the container to finish setup, then center the container on the mouse
	container.call_deferred("set_pivot_offset", container.custom_minimum_size / 2)

	# Show the container as the thing that follows the mouse during the drag
	set_drag_preview(container)

	# Return the text data that is being dragged
	return text_data





	#var Case1 = $Label.text
	#set_drag_preview($Label)
	#print(Case1)
	#return Case1
	
func _can_drop_data(_pos, data):
	return canDrop
	
func _drop_data(_pos, data):
	var CaseDrop = data
	print("dropped " + CaseDrop)
	var caseRealDrope = CaseDrop
	$Label.text=CaseDrop

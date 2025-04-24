extends TextureRect

@export var canDrop = true
@export var acceptedClass : WORD_CLASSES

@onready var effect_manager : EffectManager

enum WORD_CLASSES
{
	WEAPONS,
	SIZE,
	EFFECT,
	ARMOR,
	RESET
}



func _ready():
	if(canDrop):
		effect_manager = $"../..".effect_manager

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

	var data = {}
	data["text"] = text_data
	data["class"] = acceptedClass
	# Return the text data that is being dragged
	return data

	
func _can_drop_data(_pos, data):

	if data["class"] == acceptedClass or data["class"] == WORD_CLASSES.RESET :
		return true
	else:
		return false
	
func _drop_data(_pos, data):
	if data["text"] != "Reset":
		$Label.text=data["text"]
		print(data["text"])
		effect_manager.apply_effect(data["text"])
	else:
		#reset de la taille
		if acceptedClass == WORD_CLASSES.SIZE:
			effect_manager.reset_size_word()
			$Label.text = "Normal"
			
		#reset des armes (épée de base)
		elif acceptedClass == WORD_CLASSES.WEAPONS:
			effect_manager.reset_weapon()
			$Label.text = "Epée"
			
		elif acceptedClass == WORD_CLASSES.EFFECT:
			effect_manager.reset_effect()
			$Label.text = "Aucun"
			
		elif acceptedClass == WORD_CLASSES.ARMOR:
			effect_manager.reset_armor()
			$Label.text = "Aucune"
		
		

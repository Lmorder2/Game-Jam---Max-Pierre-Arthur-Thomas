extends TextureRect

@export var canDrop = true
@export var acceptedClass : WORD_CLASSES
@export var sprite : Sprite2D
@export var collisionPolygon : CollisionPolygon2D
var originalSpriteSizeX
var originalSpriteSizeY
var originalColSizeX
var originalColSizeY



enum WORD_CLASSES
{
	WEAPONS,
	SIZE,
	EFFECT,
	ARMOR
}


func _ready() -> void:
	if(canDrop):
		originalSpriteSizeX = sprite.scale.x
		originalSpriteSizeY = sprite.scale.y
		originalColSizeX = collisionPolygon.scale.x
		originalColSizeY = collisionPolygon.scale.y

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
	if data["class"] == acceptedClass :
		return true
	else:
		return false
	
func _drop_data(_pos, data):
	$Label.text=data["text"]
	print(data["text"])
	
	
	#Si le mot est petit
	if (data["text"]) == "Petit":
		#minus size sprite
		sprite.scale.x = originalSpriteSizeX
		print("SizeSpriteX : " + str(originalSpriteSizeX))
		sprite.scale.y = originalSpriteSizeY
		print("SizeSpriteY : " + str(originalSpriteSizeY))
		sprite.scale.x -= 0.1
		var newSizeSpriteX = sprite.scale.x
		print("SizeSpriteX Après Down : " + str(newSizeSpriteX))
		sprite.scale.y -= 0.1
		var newSizeSpriteY = sprite.scale.y
		print("SizeSpriteY Après Down : " + str(newSizeSpriteY))
		print("SizeSpriteX Original après Down : " + str(originalSpriteSizeX))
		print("SizeSpriteY Original après Down : " + str(originalSpriteSizeY))
		
		#minus size collision shape
		collisionPolygon.scale.x = originalColSizeX
		print("SizeColX : " + str(originalColSizeX))
		collisionPolygon.scale.y = originalColSizeY
		print("SizeColY : " + str(originalColSizeY))
		collisionPolygon.scale.x -= 0.1
		var newSizeColX = collisionPolygon.scale.x
		print("SizeColX Après Down: " + str(newSizeColX))
		collisionPolygon.scale.y -= 0.1
		var newSizeColY = collisionPolygon.scale.y
		print("SizeColY Après Down : " + str(newSizeColY))
		print("SizeColX Original aprèsDown : " + str(originalColSizeX))
		print("SizeColY Original aprèsDown : " + str(originalColSizeY))
		
	#for major sprite and coollision size
	if (data["text"]) == "Grand":
		#minus size sprite
		sprite.scale.x = originalSpriteSizeX
		print("SizeSpriteX : " + str(originalSpriteSizeX))
		sprite.scale.y = originalSpriteSizeY
		print("SizeSpriteY : " + str(originalSpriteSizeY))
		sprite.scale.x += 0.1
		var newSizeSpriteX = sprite.scale.x
		print("SizeSpriteX Après Up: " + str(newSizeSpriteX))
		sprite.scale.y += 0.1
		var newSizeSpriteY = sprite.scale.y
		print("SizeSpriteY Après Up : " + str(newSizeSpriteY))
		print("SizeSpriteX Original après Up : " + str(originalSpriteSizeX))
		print("SizeSpriteY Original après Up: " + str(originalSpriteSizeY))
		
		#minus size collision shape
		collisionPolygon.scale.x = originalColSizeX
		print("SizeColX : " + str(originalColSizeX))
		collisionPolygon.scale.y = originalColSizeY
		print("SizeColY : " + str(originalColSizeY))
		collisionPolygon.scale.x -= 0.1
		var newSizeColX = collisionPolygon.scale.x
		print("SizeColX Après Up : " + str(newSizeColX))
		collisionPolygon.scale.y -= 0.1
		var newSizeColY = collisionPolygon.scale.y
		print("SizeColY Après Up : " + str(newSizeColY))
		print("SizeColX Original après Up : " + str(originalColSizeX))
		print("SizeColY Original après Up : " + str(originalColSizeY))
	

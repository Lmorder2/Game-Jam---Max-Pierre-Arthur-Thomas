extends ColorRect


# Called when the node enters the scene tree for the first time.
func _ready():
	show() #Replace hide quand version final


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("alt"):
		show()
	else:
		show() #replace Hide quand version finale

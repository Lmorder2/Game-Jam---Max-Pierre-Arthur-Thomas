extends ColorRect

@export var effect_manager : EffectManager
# Called when the node enters the scene tree for the first time.
func _ready():
	hide() #Replace hide quand version final


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("alt"):
		show()
	else:
		hide() #replace Hide quand version finale

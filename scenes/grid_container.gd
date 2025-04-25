extends GridContainer

func _ready() -> void:
	Events.item_picked.connect(item_picked)
	#$Case1.hide()
	#$Case2.hide()
	#$Case3.hide()
	#$Case4.hide()
	#$Case5.hide()
	#$Case6.hide()
	#$Case7.hide()
	#$Case8.hide()
	#$Case9.show()

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("deblock case test")):
		$Case4.show()

func item_picked(item):
	print("picked up item " + item)

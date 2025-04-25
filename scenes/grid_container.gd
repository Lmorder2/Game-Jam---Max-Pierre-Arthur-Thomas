extends GridContainer

func _ready() -> void:
	Events.item_picked.connect(item_picked)
	$Case1.hide()
	$Case2.hide()
	$Case3.hide()
	$Case4.hide()
	$Case5.hide()
	$Case6.hide()
	$Case9.show()

#func _process(delta: float) -> void:
	#if(Input.is_action_just_pressed("deblock case test")):
		#$Case4.show()

func item_picked(item):
	if item == "Sword":
		$Case3.show()
	elif item == "Bow":
		$Case4.show()
	elif item == "Shrink":
		$Case2.show()
	elif item == "Poison":
		$Case5é.show()
	elif item == "Grand":
		$Case1.show()
	elif item == "Stun":
		$Case6.show()

extends GridContainer

func _ready() -> void:
	$Case1.hide()
	$Case2.hide()
	$Case3.hide()
	$Case4.hide()
	$Case5.hide()
	$Case6.hide()
	$Case7.hide()
	$Case8.hide()
	$Case9.show()

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("alt")):
		$Case4.show()

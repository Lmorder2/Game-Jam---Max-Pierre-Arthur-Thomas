extends Node2D

const speed = 30
var currente_state = IDLE
var dir = Vector2.RIGHT

var start_pos

enum{
	IDLE,
	NEW_DIR,
	MOVE
}

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	start_pos = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match currente_state:
		IDLE:
			pass
		NEW_DIR:
			dir = choose([Vector2.RIGHT,Vector2.UP,Vector2.LEFT,Vector2.DOWN])
		MOVE:
			move(delta)
func move(delta):
	position += dir * speed * delta
	
	if position.x >= start_pos + 20:
		position.x = 19.9
	
func choose(array):
	array.chuffle()
	return array.front()

func _On_Timer_timout():
	$Timer.wait_time = choose([0.5,1,1.5])
	currente_state = choose([IDLE,NEW_DIR,MOVE])
	
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Area Entered")

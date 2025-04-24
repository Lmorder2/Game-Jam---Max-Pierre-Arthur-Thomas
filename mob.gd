extends CharacterBody2D

var speed = 40
var player_chase = false
var player = null
	
signal death(mob: Node)

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("kill_mobs")):
		emit_signal("death", self)
		queue_free()

func _physics_process(delta: float) -> void:
	if player_chase:
		position += (player.position - position)/speed
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		move_and_collide(Vector2(0,0))	

func _on_detection_area_body_entered(body: Node2D) -> void:
	if(body.name=="Player"):
		player = body# Replace with function body.
		player_chase = true

func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null # Replace with function body.
	player_chase = false

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name=="Player"):
		print("you are dead") # Replace with function body.

func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.

func _on_health_manager_death() -> void:
	emit_signal("death", self)
	queue_free()

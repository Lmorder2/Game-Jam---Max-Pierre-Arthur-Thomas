extends CharacterBody2D
var damage_amount = 500
const MAX_SPEED = 100.0
const ACCELERATION = 1000.0
const FRICTION = 500.0
var is_stun = false
var player_chase = true
var acceleration_ratio = 1.0

@export var START_GAME : Node2D
#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
#mouvement 
func _physics_process(delta: float) -> void:
	var input = Input.get_vector("left", "right", "up", "down")
	if input.length() > 0 and player_chase:
	#	if input.x != 0: animated_sprite_2d.scale.x = sign(input.x)
		velocity = velocity.move_toward(input * MAX_SPEED * acceleration_ratio, acceleration_ratio * ACCELERATION * delta)
	
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	move_and_slide()
	if velocity == Vector2(0.0,0.0):
		$Sprite2D.play("Idle")
	elif velocity >= Vector2(0.0,0.0):
		#$Sprite2D.flip_h
		$Sprite2D.play("Move")
		
	elif velocity <= Vector2(0.0,0.0):
		$Sprite2D.flip_h = true
		$Sprite2D.play("Move")
		


func _on_animated_sprite_2d_animation_finished() -> void:
	pass # Replace with function body.

func attack(body):
	body.get_node("HealthManager").take_damage(damage_amount)

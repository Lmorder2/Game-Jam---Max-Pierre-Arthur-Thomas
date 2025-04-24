extends CharacterBody2D

const MAX_SPEED = 100.0
const ACCELERATION = 1000.0
const FRICTION = 500.0

#@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
#mouvement 
func _physics_process(delta: float) -> void:
	var input = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input.length() > 0:
	#	animated_sprite_2d.play("run")
		velocity = velocity.move_toward(input * MAX_SPEED, ACCELERATION * delta)
	#	if input.x != 0: animated_sprite_2d.scale.x = sign(input.x)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	#	animated_sprite_2d.play("idle")
	move_and_slide()



func _on_animated_sprite_2d_animation_finished() -> void:
	pass # Replace with function body.

func attack(body):
	body.get_node("HealthManager").take_damage(20)

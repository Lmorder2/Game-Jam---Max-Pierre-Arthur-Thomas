
extends CharacterBody2D
 
@onready var player = get_parent().find_child("Player")
@onready var sprite = $Sprite2D

var speed = 100

var direction : Vector2

var near_player : bool
 
func _ready():
	pass
 
func _process(_delta):
	if near_player:
		direction = player.position - position
		position += (player.position - position)/speed

		if direction.x < 0:
			sprite.flip_h = true
		else:
			sprite.flip_h = false
 
func _physics_process(delta):
	velocity = direction.normalized()
	move_and_collide(velocity * delta)


func _on_player_detection_body_entered(body: Node2D) -> void:
	print(body.name)
	if(body.name == "Player"):
		near_player = true
	

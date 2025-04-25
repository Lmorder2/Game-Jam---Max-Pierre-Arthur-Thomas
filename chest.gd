extends Node2D

@export var item_name : String

@onready var animation_player = $AnimatedSprite2D

var is_open = false
var player_chase = false
var player = null

func _ready():
	$Item/DropChest.hide()
	
func _on_body_entered(body):
	print("Le joueur entre en collision avec le coffre", body.name)
	if body.name == "Player" and not is_open:
		is_open = true
		animation_player.play("trigger")
		$Item/DropChest.show()

func _on_grow_body_entered(body: Node2D) -> void:
	$Item/DropChest.visible = false
	$Item/dropchest_collision.visible = false
	Events.item_picked.emit(item_name)
	print("le joueur reup l'item   " + str(item_name))

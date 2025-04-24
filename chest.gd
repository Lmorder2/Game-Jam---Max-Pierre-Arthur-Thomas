extends Node2D

@onready var sprite_closed = $closed_chest
@onready var sprite_opened = $opened_chest
@export var item_name : String

var is_open = false
var player_chase = false
var player = null

func _ready():
	sprite_closed.visible = true
	sprite_opened.visible = false
	$Item/DropChest.hide()
	
func _on_body_entered(body):
	print("Le joueur entre en collision avec le coffre", body.name)
	if body.name == "Player" and not is_open:
		is_open = true
		sprite_closed.visible = false
		sprite_opened.visible = true
		$Item/DropChest.show()

func _on_grow_body_entered(body: Node2D) -> void:
	$Item/DropChest.hide()

extends Node2D

@onready var area = $chest_zone
@onready var sprite_closed = $closed_chest
@onready var sprite_opened = $opened_chest

var is_open = false

var player_chase = false
var player = null

func _ready():
	sprite_closed.visible = true
	sprite_opened.visible = false
	$Grow/DropChest.hide()
	
func _on_body_entered(body):
	print("Le joueur entre en collision avec le coffre", body.name)
	if body.name == "Player" and not is_open:
		is_open = true
		sprite_closed.visible = false
		sprite_opened.visible = true
	$Grow/DropChest.show()


func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body# Replace with function body.
	player_chase = true


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = null # Replace with function body.
	player_chase = false
	
func _on_grow_body_entered(body: Node2D) -> void:
	if(body.name=="Player"):
		$Grow/DropChest.hide()
		print("znab")
		queue_free()

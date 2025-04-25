extends Area2D

@export var item_name : String

func _on_body_entered(body: Node2D) -> void:
	print(body.name)
	if(body.name == "Player"):
		Events.item_picked.emit(item_name)
		print(str(item_name))
		queue_free()

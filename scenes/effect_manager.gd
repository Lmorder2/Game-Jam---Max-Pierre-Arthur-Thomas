extends Node2D

class_name EffectManager

@export var sprite : Sprite2D
@export var collisionPolygon : CollisionPolygon2D
@export var sword : Node2D
@export var bow : Node2D

var originalSpriteSizeX
var originalSpriteSizeY
var originalColSizeX
var originalColSizeY
var originalStateSword
var originalStateBow


func _ready() -> void:
	originalSpriteSizeX = sprite.scale.x
	originalSpriteSizeY = sprite.scale.y
	originalColSizeX = collisionPolygon.scale.x
	originalColSizeY = collisionPolygon.scale.y
	sword.set_process(true)
	sword.show()
	print("état de sword set process"+str(sword.is_processing()))
	originalStateSword = sword.is_processing()
	bow.set_process(false)
	bow.hide()
	print("état de bow set process"+str(bow.is_processing()))
	originalStateBow = bow.is_processing()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func reset_size_word():
	collisionPolygon.scale.x = originalColSizeX
	collisionPolygon.scale.y = originalColSizeY
	sprite.scale.x = originalSpriteSizeX
	sprite.scale.y = originalSpriteSizeY
	
func reset_weapon():
	bow.set_process(false)
	sword.set_process(true)
	bow.hide()
	sword.show()
	
func reset_armor():
	pass
	
	
func reset_effect():
	pass
	
func apply_effect(effect : String) -> void:
	#Si le mot est petit
	if (effect) == "Petit":
		#- size sprite and col
		reset_size_word()
		sprite.scale.x -= 0.1
		sprite.scale.y -= 0.1
		collisionPolygon.scale.x -= 0.1
		collisionPolygon.scale.y -= 0.1
		
	#for major sprite and coollision size
	if (effect) == "Grand":
		#+ size sprite and collision
		reset_size_word()
		sprite.scale.x += 0.1
		sprite.scale.y += 0.1
		collisionPolygon.scale.x -= 0.1
		collisionPolygon.scale.y -= 0.1
	#
		#Switch épée / arc
	if (effect) == "Epée":
		bow.set_process(false)
		sword.set_process(true)
		bow.hide()
		sword.show()
		print("switch to SWORD; Etat de sword " + str(sword.is_processing()) + " Etat de Bow " + str(bow.is_processing()))
		
		
	if (effect) == "Arc":
		bow.set_process(true)
		sword.set_process(false)
		sword.hide()
		bow.show()
		print("switch to BOW; Etat de bow " + str(bow.is_processing()) + " Etat de Sword " + str(sword.is_processing()))
		

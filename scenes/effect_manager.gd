extends Node2D

class_name EffectManager

@export var sprite : AnimatedSprite2D
@export var collisionPolygon : CollisionPolygon2D
@export var sword : Node2D
@export var bow : Node2D
@export var healthManager : Node2D
var originalSpriteSize
var originalColSize
var originalStateSword
var originalStateBow
var originalScalSword
var originalScalBow
var originalDamageAmount
var scaleEffect = Vector2(0.4,0.4)


func _ready() -> void:
	$ParticlePoison.emitting = false
	$ParticleStun.emitting = false
	originalSpriteSize = Vector2(sprite.scale)
	originalColSize = Vector2(collisionPolygon.scale)
	originalScalSword = Vector2(sword.scale)
	originalScalBow = Vector2(bow.scale)
	originalDamageAmount = $"..".damage_amount
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
	sprite.scale = originalSpriteSize
	collisionPolygon.scale = originalColSize
	sword.scale = originalScalSword
	bow.scale = originalScalBow
	$"..".acceleration_ratio = 1.0
	$"..".damage_amount += originalDamageAmount
	
func reset_weapon():
	bow.set_process(false)
	sword.set_process(true)
	bow.hide()
	sword.show()
	
func reset_armor():
	pass
	
	
func reset_effect():
	print("Reset Effects")
	pass
	
func apply_effect(effect : String, case) -> void:
	
	#Si le mot est petit
	if (effect) == "Petit":
		#- size sprite and col
		reset_size_word()
		sprite.scale -= scaleEffect
		collisionPolygon.scale -= scaleEffect
		bow.scale -= scaleEffect
		sword.scale -= scaleEffect
		$"..".acceleration_ratio = 1.5
		$"..".damage_amount *= 0.5

		
		
	#for major sprite and coollision size
	if (effect) == "Grand":
		#+ size sprite and collision
		reset_size_word()
		sprite.scale += scaleEffect
		#collisionPolygon.scale += scaleEffect
		bow.scale += scaleEffect
		sword.scale += scaleEffect
		$"..".acceleration_ratio = 0.5
		$"..".damage_amount *= 2
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
		
		
	if (effect) == "Poison":
		reset_effect()
		$ParticlePoison.emitting = true
		for i in range(5):
			$PoisonTimer.wait_time = 5
			healthManager.amount = 10
			healthManager.take_damage(healthManager.amount)
			$PoisonTimer.start()
			await $PoisonTimer.timeout
		$ParticlePoison.emitting = false
		case.reset_case()
		reset_effect()

			
		
		
	if (effect) == "Immobile":
		reset_effect()
		$ParticleStun.emitting = true
		$StunTimer.wait_time = 6
		$StunTimer.start()
		$"..".player_chase = false
		$"..".is_stun = true
		await $StunTimer.timeout
		$"..".player_chase = true
		$"..".is_stun = false
		$ParticleStun.emitting = false
		case.reset_case()
		reset_effect()

extends Node2D

@export var healthMax = 100.0
var healthActual
var healthCalc
var lifeBar
var amount
var originalHealthMax = healthMax

signal death

func _ready() -> void:
	healthActual = healthMax
	lifeBar = $ProgressBar
	lifeBar.set_max(healthMax)
	lifeBar.set_value(healthActual)
	amount = 0

func life_reset():
	healthMax = originalHealthMax
	healthActual = healthMax
	lifeBar.set_max(healthMax)
	lifeBar.set_value(healthActual)
	
func life_update():
	lifeBar.set_value(healthActual)
	
func life_max_update():
	lifeBar.set_max(healthMax)
	
func _process(delta):
	pass
		

func take_damage(amount):
	healthCalc = healthActual
	healthCalc -= amount
	if healthCalc <= 0:
		healthActual = 0
		amount = 0
		life_update()
		death.emit()
		if $"..".name == "Player":
			print("le joueur est mort")
			$"..".global_position = $"..".START_GAME.global_position
			life_reset()
		
	elif healthCalc >= healthMax :
		healthActual = healthMax
		print("full vie max")
		amount = 0
		life_update()
		
	else:
		healthActual -= amount
		life_update()
		print("damage pris")
		amount = 0
		
	

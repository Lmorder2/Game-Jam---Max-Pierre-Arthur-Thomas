extends Node2D

@export var healthMax = 100.0
var healthActual
var healthCalc
var lifeBar
var amount
var originalHealthMax = healthMax

func _ready() -> void:
	healthActual = healthMax
	lifeBar = $ProgressBar
	lifeBar.set_max(healthMax)
	lifeBar.set_value(healthActual)
	amount = 0

func life_reset():
	healthMax = originalHealthMax
	lifeBar.set_max(healthMax)
	healthActual.set_value(healthMax)
	
func life_update():
	lifeBar.set_value(healthActual)
	
func life_max_update():
	lifeBar.set_max(healthMax)
	
func _process(delta):
	lifeBar.set_max(healthMax)
	lifeBar.set_value(healthActual)
		

func take_damage(amount):
	healthCalc = healthActual
	healthCalc -= amount
	if healthCalc <= 0:
		healthActual = 0
		print("DEAAAD")
		amount = 0
	elif healthCalc >=100:
		healthActual = 100
		print("full vie max")
		amount = 0
	else:
		healthActual -= amount
		life_update()
		print("damage pris")
		amount = 0
		
	

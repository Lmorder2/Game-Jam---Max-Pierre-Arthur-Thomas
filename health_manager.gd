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
	healthActual.set(healthMax)
	
func life_update():
	lifeBar.set(healthActual)
	
func life_max_update():
	lifeBar.set_max(healthMax)
	
func _process(delta):
	lifeBar.set_max(healthMax)
	lifeBar.set_value(healthActual)
	if Input.is_action_just_pressed("Damage test +"):
		amount += 1
		take_damage(amount)
		amount = 0
	
	elif Input.is_action_just_pressed("Damage test -"):
		amount -=1
		take_damage(amount)
		amount = 0
		

func take_damage(amount):
	healthCalc = healthActual
	healthCalc -= amount
	if healthCalc <= 0:
		healthActual = 0
		print("DEAAAD")
	elif healthCalc >=100:
		healthActual = 100
	else:
		healthActual -= amount
		
	

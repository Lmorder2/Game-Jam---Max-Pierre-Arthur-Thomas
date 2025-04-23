extends Area2D

@onready var sword_attack = $weapons/SwordAttack
var attack_duration = 0.2  # Durée d'activation de la hitbox

# Called when the node enters the scene tree for the first time.
func _ready():
	sword_attack.disabled = true  # Si c'est une CollisionShape2D ou Area2D
	# sinon, utilise sword_attack.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Attack"):
		activate_sword_attack()
	look_at(get_global_mouse_position())
	
func activate_sword_attack():
	sword_attack.disabled = false
	await get_tree().create_timer(attack_duration).timeout
	sword_attack.disabled = true

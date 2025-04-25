extends Area2D
@export var attackSpeedArg1 : float
@export var attackSpeedArg2 : float
@export var hitbox : CollisionPolygon2D
var attack_duration = 0.2  # Durée d'activation de la hitbox

@export var is_player = false

# Called when the node enters the scene tree for the first time.
func _ready():
	monitoring = false
	
	$Sprite2D.visible = false  # Si c'est une CollisionShape2D ou Area2D
	# sinon, utilise sword_attack.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_player:
		if Input.is_action_just_pressed("Attack"):
			activate_sword_attack()
		look_at(get_global_mouse_position())

func look_at_target(target: Vector2) -> void:
	var target_angle = (target - global_position).angle()
	var rotaSpeed = (randf_range(attackSpeedArg1, attackSpeedArg2))
	rotation = lerp_angle(rotation, target_angle, rotaSpeed)  # 0.1 = vitesse de rotation

#randi_range(from: int, to: int)
	
func activate_sword_attack():
	monitoring = true
	$Sprite2D.visible = true
	await get_tree().create_timer(attack_duration).timeout
	
	
	monitoring = false
	$Sprite2D.visible = false

func _on_body_entered(body: Node2D) -> void:
	if(get_parent().has_method("attack")):
		get_parent().attack(body)

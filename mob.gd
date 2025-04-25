extends CharacterBody2D

var damage_amount = 5
var speed = 40
var player_chase = false
var player = null
@export var drop_scene: PackedScene

signal death(mob: Node)



var is_stun=false
var acceleration_ratio = 1.0
func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("kill_mobs")):
		drop_loot() 
		emit_signal("death", self)
		queue_free()

func _physics_process(delta: float) -> void:
	if player_chase and is_stun==false:
		global_position += ((player.global_position - global_position)/speed)*acceleration_ratio
		if (player.global_position.x - global_position.x) < 0:
			$AnimatedSprite2D.play("Move")
		move_and_collide(Vector2(0,0))
		$WeaponsSword.look_at_target(player.global_position)
		$WeaponsBow.look_at_target(player.global_position)
		if global_position.x >= 0.0:
			$AnimatedSprite2D.flip_h = true
		if global_position.x <= 0.0:
			$AnimatedSprite2D.flip_h = false

func _on_detection_area_body_entered(body: Node2D) -> void:
	if(body.name == "Player"):
		player = body # Replace with function body.
		player_chase = true

func _on_detection_area_body_exited(body: Node2D) -> void:
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if(body.name=="Player"):
		print("you are dead") # Replace with function body.

func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
	

	
func _on_health_manager_death() -> void:
	drop_loot() 
	emit_signal("death", self)
	queue_free()

func _on_mob_attack_timer_timeout() -> void:
	if(player):
		$WeaponsSword.activate_sword_attack()
		$WeaponsBow.activate_sword_attack()

func drop_loot():
	if drop_scene:
		var drop_instance = drop_scene.instantiate()
		get_parent().add_child(drop_instance)
		drop_instance.global_position = global_position

func attack(player):
	player.get_node("HealthManager").take_damage(5)
	

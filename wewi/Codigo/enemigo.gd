extends CharacterBody2D

const SPEED = 70
const GRAVITY = 98



func _ready() -> void:
	velocity.x = -SPEED
	
	


func _physics_process(delta: float) -> void:
	velocity.y +=GRAVITY
	if is_on_wall():
		if !$AnimatedSprite2D.flip_h:
			velocity.x = SPEED
		else:
			velocity.x = -SPEED
		if  velocity.x < 0 :
			$AnimatedSprite2D.flip_h = false
		elif velocity.x > 0 :
			$AnimatedSprite2D.flip_h = true
			
	

	move_and_slide()
	
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("perro")
	get_tree().reload_current_scene()

extends CharacterBody2D


	
const SPEED = 200.0
const JUMP_VELOCITY = -300.0
@onready var salto: AudioStreamPlayer2D = $salto
@onready var ray_cast_2d: RayCast2D = $RayCast2D
var salto_buffering : bool = false
@onready var durcion_buffering:float = 0.15


#esto es el coyote time pibes
var coyote_tiempo = 1.0
var coyote_tiempo_acabado = 0.0

#esto es el buffer o como se escriba xd
var salto_buffer_tiempo = 1.0
var salto_buffer_tiempo_acabado = 0.0



func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if is_on_floor():
		coyote_tiempo_acabado = coyote_tiempo
	else:
		coyote_tiempo_acabado -= delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$salto.play()
	
	
	if Input.is_action_just_pressed("ui_accept") and coyote_tiempo_acabado > 0:
		velocity.y = JUMP_VELOCITY
		$salto.play()
		coyote_tiempo_acabado = 0
		
	if Input.is_action_just_pressed("ui_accept"):
		salto_buffer_tiempo_acabado = salto_buffer_tiempo
	else:
		salto_buffer_tiempo_acabado -= delta
		
	if salto_buffer_tiempo_acabado > 0 and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$salto.play()
		salto_buffer_tiempo_acabado = 0
		
		
# Saltar si hay buffer y estás en el suelo

		
		


	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction > 0:
		$AnimatedSprite2D.scale.x=1
	elif direction < 0:
		$AnimatedSprite2D.scale.x=-1
		
		
	
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			$AnimatedSprite2D.play("Idle")
			

	
		
	move_and_slide()
	
func saltarin_salto(cantidad_impulso):
	velocity.y = -cantidad_impulso
		
func coyote():
	return $RayCast2D.is_colliding()
	

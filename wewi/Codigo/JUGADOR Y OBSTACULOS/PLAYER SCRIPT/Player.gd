extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -385.0
@onready var salto: AudioStreamPlayer2D = $salto
@onready var ray_cast_2d: RayCast2D = $RayCast2D
var salto_buffering : bool = false
@onready var durcion_buffering:float = 0.15

var coyote_tiempo = 1.0
var coyote_tiempo_acabado = 0.0

var prev_platform_pos: Vector2 = Vector2.ZERO
var platform_velocity: Vector2 = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if is_on_floor():
		coyote_tiempo_acabado = coyote_tiempo
	else:
		coyote_tiempo_acabado -= delta

	if Input.is_action_just_pressed("ui_accept") and (is_on_floor() or coyote_tiempo_acabado > 0):
		velocity.y = JUMP_VELOCITY
		salto.play()
		coyote_tiempo_acabado = 0

	var direction := Input.get_axis("ui_left", "ui_right")

	if direction > 0:
		$AnimatedSprite2D.scale.x = 1
	elif direction < 0:
		$AnimatedSprite2D.scale.x = -1

	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			$AnimatedSprite2D.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			$AnimatedSprite2D.play("Idle")


	# --- Plataforma animada ---
#que carajo hicieron? xd
	var floor_collision := null
	if get_slide_collision_count() > 0:
		floor_collision = get_slide_collision(0)

	if is_on_floor() and floor_collision and floor_collision.get_collider() is AnimatableBody2D:
		var floor = floor_collision.get_collider()
		var current_pos = floor.global_position
		if prev_platform_pos != Vector2.ZERO:
			platform_velocity = (current_pos - prev_platform_pos) / delta
		prev_platform_pos = current_pos
	else:
		platform_velocity = Vector2.ZERO
		prev_platform_pos = Vector2.ZERO

	move_and_slide()
	position += platform_velocity * delta  # Mueve al personaje junto a la plataforma


func saltarin_salto(cantidad_impulso):
	velocity.y = -cantidad_impulso

func coyote():
	return ray_cast_2d.is_colliding()

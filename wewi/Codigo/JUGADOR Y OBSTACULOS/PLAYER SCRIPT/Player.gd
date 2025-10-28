extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -300.0

@onready var salto: AudioStreamPlayer2D = $salto
@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

var coyote_tiempo = 1.0
var coyote_tiempo_acabado = 0.0

var is_dead: bool = false

# --- Respawn ---
var respawn_enabled: bool = true
var respawn_position: Vector2 = Vector2.ZERO
var respawn_delay: float = 1.0


func _ready() -> void:
	respawn_position = global_position

func _physics_process(delta: float) -> void:
	if is_dead:
		velocity = Vector2.ZERO
		return

	# --- Física normal ---
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
		anim.scale.x = 1
	elif direction < 0:
		anim.scale.x = -1

	if direction != 0:
		velocity.x = direction * SPEED
		if is_on_floor():
			anim.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			anim.play("Idle")

	move_and_slide();

func morir():
	if is_dead:
		return
	is_dead = true
	anim.play("Death")  # nombre exacto de tu animación
	set_physics_process(false)
	print("Jugador ha muerto")

func morir_tiempo():
	if is_dead:
		return
	is_dead = true
	anim.play("Death2")  # nombre exacto de tu animación
	set_physics_process(false)
	print("Jugador ha muerto")

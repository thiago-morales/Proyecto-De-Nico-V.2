extends CanvasLayer

#@onready var reloj: TextureProgressBar = $TextureProgressBar
@onready var reloj: TextureRect = $TextureProgressBar

@onready var tiempo_barra = $ProgressBar
@onready var jugador = $"../CharacterBody2D"

var tiempo_maximo := 25.0
var tiempo_actual := 25.0

var sprites_reloj := [
	preload("res://Carpeta de imagenes Para Cinematicas/clock0.png"), # 100%
	preload("res://Carpeta de imagenes Para Cinematicas/clock1.png"), # 75%
	preload("res://Carpeta de imagenes Para Cinematicas/clock2.png"), # 50%
	preload("res://Carpeta de imagenes Para Cinematicas/clock3.png"), # 25%
	preload("res://Carpeta de imagenes Para Cinematicas/clock4.png")  # 0% (alarma)
]

func actualizar_reloj():
	var porcentaje := tiempo_actual / tiempo_maximo

	if porcentaje > 0.80:
		reloj.texture = sprites_reloj[0]
	elif porcentaje > 0.60:
		reloj.texture = sprites_reloj[1]
	elif porcentaje > 0.40:
		reloj.texture = sprites_reloj[2]
	elif porcentaje > 0.20:
		reloj.texture = sprites_reloj[3]
	else:
		reloj.texture = sprites_reloj[4]

func _ready():
	# IMPORTANTE: esto hace que la barra represente 25 segundos exactos
	tiempo_barra.max_value = tiempo_maximo
	tiempo_barra.value = tiempo_actual


func _process(delta):
	tiempo_actual -= delta
	
	if tiempo_actual < 0:
		tiempo_actual = 0
		fin_del_tiempo()
	
	tiempo_barra.value = tiempo_actual
	actualizar_reloj()


func fin_del_tiempo():
	if jugador and jugador.has_method("morir_tiempo"):
		jugador.morir_tiempo()

	await get_tree().create_timer(1.5).timeout
	get_tree().reload_current_scene()
	

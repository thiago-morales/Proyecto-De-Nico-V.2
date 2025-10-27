extends CanvasLayer

@onready var tiempo_barra = $ProgressBar  # o la ruta a tu ProgressBar
@onready var jugador:  = $"../CharacterBody2D"

var tiempo_maximo := 25.0
var tiempo_actual := 25.0


func _process(delta):
	tiempo_actual -= delta
	if tiempo_actual < 0:
		tiempo_actual = 0
		fin_del_tiempo()
	tiempo_barra.value = tiempo_actual
	
func fin_del_tiempo():
	if jugador and jugador.has_method("morir"):
		jugador.morir()

	await get_tree().create_timer(1.5).timeout  # espera que termine la animación
	get_tree().reload_current_scene()
	# Acá podés hacer que termine el juego, pase de nivel, etc.

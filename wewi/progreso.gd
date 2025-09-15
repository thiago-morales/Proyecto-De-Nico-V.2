extends CanvasLayer

@onready var tiempo_barra = $ProgressBar  # o la ruta a tu ProgressBar

var tiempo_maximo := 25.0
var tiempo_actual := 25.0


func _process(delta):
	tiempo_actual -= delta
	if tiempo_actual < 0:
		tiempo_actual = 0
		fin_del_tiempo()
	tiempo_barra.value = tiempo_actual
	
func fin_del_tiempo():
	print("¡Se acabó el tiempo!")
	get_tree().reload_current_scene()
	# Acá podés hacer que termine el juego, pase de nivel, etc.

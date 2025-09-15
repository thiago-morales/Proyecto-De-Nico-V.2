extends Control

@onready var contenedor = $VBoxContainer  # Asegurate que el VBox se llame así

const TOTAL_MUNDOS = 5  # Cambiá esto al total de niveles que tengas

func _ready():
	# Cargar el progreso del jugador
	Guardado.cargar_progreso()
	var max_desbloqueado = Guardado.nivel_max_desbloqueado

	# Crear los botones para cada mundo
	for i in range(1, TOTAL_MUNDOS + 1):
		var boton = Button.new()
		boton.text = "Mundo %d" % i
		var ruta = "res://Escenas/Mundo%d.tscn" % i

		# Desactivar botón si el mundo aún no está desbloqueado
		boton.disabled = i > max_desbloqueado

		# Conectar al evento cuando se presiona
		boton.pressed.connect(_on_mundo_presionado.bind(ruta))

		# Agregar el botón al VBoxContainer
		contenedor.add_child(boton)

func _on_mundo_presionado(ruta: String):
	get_tree().change_scene_to_file(ruta)

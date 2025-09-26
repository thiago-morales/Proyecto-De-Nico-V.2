extends Node

var Mundo: int = 3:
	set(value):
		Mundo = value
		_on_mundo_changed(value)

func _ready() -> void:
	pass # Este nodo se carga automáticamente

func _on_mundo_changed(Mundo: int) -> void:
	print("Nivel (mundo) cambiado a:", Mundo)
	# Acá podrías hacer lógica como cargar una nueva escena, etc.

	

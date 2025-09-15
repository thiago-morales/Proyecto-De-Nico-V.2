extends Node

var puntacion = 0

signal puntuacion_actualizada(puntacion_actual:int)

func incrementa_punto():
	puntacion += 1
	puntuacion_actualizada.emit(puntacion)
	
	

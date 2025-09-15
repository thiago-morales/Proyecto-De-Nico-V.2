extends Node
# scripts/Guardado.gd

var nivel_max_desbloqueado: int = 1  # Por defecto solo Mundo1

const SAVE_PATH = "user://progreso.save"

func guardar_progreso():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_32(nivel_max_desbloqueado)
	file.close()

func cargar_progreso():
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		nivel_max_desbloqueado = file.get_32()
		file.close()

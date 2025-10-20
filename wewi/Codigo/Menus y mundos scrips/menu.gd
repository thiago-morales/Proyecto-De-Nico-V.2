extends Control




func _on_inicio_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu y selector/SELECTOR DE NIVELES.tscn")


func _on_salida_pressed() -> void:
	get_tree().quit()

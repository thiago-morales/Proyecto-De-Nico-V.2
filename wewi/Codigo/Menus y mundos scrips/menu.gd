extends Control

func _ready() -> void:
	VariablesGlobales.intentos = 0


func _on_inicio_pressed() -> void:
	get_tree().change_scene_to_file("res://Cinematicas/iconoes.tscn")


func _on_salida_pressed() -> void:
	get_tree().quit()

extends Control


func _on_back_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/menu y selector/menu.tscn")



func _on_nivel_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Escenas/Carpeta De Mundos Utilizables/Mundo1 V.2.tscn")

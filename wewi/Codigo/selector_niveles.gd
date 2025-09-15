extends Button

@export var level_int: int = 1
@export var level_proyect_dir: String = ""

func _on_pressed() -> void:
	if level_proyect_dir != "":
		get_tree().change_scene_to_file(level_proyect_dir)
	else:
		print("No se asignó una escena al botón.")

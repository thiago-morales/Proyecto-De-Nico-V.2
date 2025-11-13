extends CanvasLayer

func _ready() -> void:
	MusicManager.play_track("creditos")
	
func _physics_process(delta):
		cargar()
		$Label.visible = not $Label.visible
		

func cargar():
	$Label.text = "Veces Muertas:  "+  str(VariablesGlobales.intentos)
	pass


func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_SHIFT) and Input.is_key_pressed(KEY_K):
		get_tree().change_scene_to_file("res://Escenas/menu y selector/menu.tscn")
	

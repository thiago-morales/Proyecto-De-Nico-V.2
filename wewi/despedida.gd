extends CanvasLayer

func _ready() -> void:
	MusicManager.play_track("creditos")
	
func _physics_process(delta):
		cargar()
		$Label.visible = not $Label.visible
		

func cargar():
	$Label.text = "Veces Muertas:  "+  str(VariablesGlobales.intentos)
	pass

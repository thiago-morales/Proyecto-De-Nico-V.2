extends CanvasLayer

func _physics_process(delta):
		cargar()
		$Label.visible = not $Label.visible
		

func cargar():
	$Label.text = "Veces Muertas:  "+  str(VariablesGlobales.intentos)
	pass

extends Node2D

var lights = []               # array con las luces
var animation_types = []      # tipo de animación para cada luz
var current_index = 0

func _ready():
	# Lista de luces
	lights = [
		$Icon/PointLight2D5,
		$Icon2/PointLight2D4,
		$Icon3/PointLight2D3,
		$Icon4/PointLight2D,
		$Icon5/PointLight2D2,
		$Icon6/PointLight2D2
	]
	
	# Definimos la animación de cada luz
	# "normal" = primera animación (expansión simple)
	# "pulse" = segunda animación (pulso inicial)
	animation_types = ["normal", "pulse", "normal", "pulse", "normal", "pulse"]

	# Inicializamos todas las luces apagadas
	for l in lights:
		l.visible = true      # visibles para el Tween
		l.scale = Vector2(0.1,0.1)
		l.energy = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if current_index < lights.size():
			var light = lights[current_index]
			var anim_type = animation_types[current_index]
			
			if anim_type == "normal":
				# Animación simple: escala + energía
				var tween = create_tween()
				tween.tween_property(light, "scale", Vector2(1,1), 0.6).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				tween.tween_property(light, "energy", 1.0, 0.6).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				
			elif anim_type == "pulse":
				# Animación pulso inicial
				var tween = create_tween()
				tween.tween_property(light, "scale", Vector2(1.2,1.2), 0.3).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
				tween.tween_property(light, "scale", Vector2(1,1), 0.3).set_delay(0.3)
				
				tween.tween_property(light, "energy", 1.2, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				tween.tween_property(light, "energy", 1.0, 0.3).set_delay(0.3)
				
			current_index += 1
		else:
			get_tree().change_scene_to_file("res://Nivel2.tscn")

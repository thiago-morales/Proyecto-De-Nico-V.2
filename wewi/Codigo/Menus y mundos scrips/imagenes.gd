extends Node2D

var lights = []
var sprites = []
var animation_types = []
var current_index = 0
var zoomed_in = false
var original_position = Vector2()  # posición inicial de la cámara

@onready var camera = $Camera2D

func _ready():
	lights = [
		$Icon/PointLight2D5,
		$Icon2/PointLight2D4,
		$Icon3/PointLight2D3,
		$Icon4/PointLight2D,
		$Icon5/PointLight2D2,
		$Icon6/PointLight2D2
	]

	sprites = [
		$Icon,
		$Icon2,
		$Icon3,
		$Icon4,
		$Icon5,
		$Icon6
	]

	animation_types = ["normal", "pulse", "normal", "pulse", "normal", "pulse"]

	for l in lights:
		l.visible = true
		l.texture_scale = 1.4
		l.energy = 0

	camera.zoom = Vector2(1, 1)
	original_position = camera.position  # guardamos la posición inicial

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		if current_index < lights.size():
			var light = lights[current_index]
			var sprite = sprites[current_index]
			var anim_type = animation_types[current_index]

			if not zoomed_in:
				# 1️⃣ Mover cámara hacia el sprite
				var tween_move = create_tween()
				tween_move.tween_property(camera, "position", sprite.global_position, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				
				# 2️⃣ Zoom hacia adentro
				var tween_zoom = create_tween()
				tween_zoom.tween_property(camera, "zoom", Vector2(1.5, 1.5), 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

				# 3️⃣ Animación de la luz
				if anim_type == "normal":
					var tween_light = create_tween()
					tween_light.tween_property(light, "energy", 1.0, 0.6).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				elif anim_type == "pulse":
					var tween_light = create_tween()
					tween_light.tween_property(light, "energy", 1.2, 0.3).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
					tween_light.tween_property(light, "energy", 1.0, 0.3).set_delay(0.3)

				zoomed_in = true
			else:
				# Volver a la posición original y zoom normal
				var tween_back = create_tween()
				tween_back.tween_property(camera, "position", original_position   , 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
				tween_back.tween_property(camera, "zoom", Vector2(0.5, 0.6), 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)

				zoomed_in = false
				current_index += 1
		else:
			get_tree().change_scene_to_file("res://Nivel2.tscn")

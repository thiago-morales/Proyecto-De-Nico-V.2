extends Area2D

@onready var jugador: CharacterBody2D = $"../../CharacterBody2D"


func _on_body_entered(body: Node2D) -> void:
	print("te pinchaste")
	if jugador and jugador.has_method("morir"):
		jugador.morir()

	await get_tree().create_timer(1.5).timeout
	get_tree().reload_current_scene()  # espera que termine la animación

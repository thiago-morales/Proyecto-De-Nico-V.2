extends Area2D


@onready var jugador: CharacterBody2D = $"../../CharacterBody2D"




# Called when the node enters the scene tree for the first time.


func _on_body_entered(body: Node2D) -> void:
	print("caiste")

	if jugador and jugador.has_method("morir"):
		jugador.morir()
		
		

	if jugador and jugador.has_method("morir"):
		jugador.morir()

	await get_tree().create_timer(1.5).timeout
	get_tree().reload_current_scene()

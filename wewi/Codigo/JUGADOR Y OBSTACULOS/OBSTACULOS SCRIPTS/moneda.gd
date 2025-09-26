extends Area2D

@onready var game_manager: Node = %GameManager




func _on_body_entered(body: Node2D) -> void:
	game_manager.incrementa_punto()
	Gameaudio.moneda.play()
	
	queue_free()

#func _on_finished() -> void:
	

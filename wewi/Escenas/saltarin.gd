extends AnimatedSprite2D

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
@export var fuerza_impulso: float = 500


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("wewi")
	body.saltarin_salto(fuerza_impulso)
	play("Idle")
	audio_stream_player_2d.play()
	
	

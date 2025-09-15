extends CanvasLayer



@onready var contador: Label = $Contador
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var game_manager = get_node("%GameManager")
	game_manager.puntuacion_actualizada.connect(_on_puntuacion_actualizada)
	
func _on_puntuacion_actualizada(puntuaction_actual:int) -> void:
		contador.text= str(puntuaction_actual)
		
		if puntuaction_actual == 5: 
			print("cambio de nivel") 
			get_tree().change_scene_to_file("res://Escenas/Mundo5.tscn")
	

	

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
			get_tree().change_scene_to_file("res://Cinematicas/Cinematica5.tscn")


func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_CTRL) and Input.is_key_pressed(KEY_S):
		get_tree().change_scene_to_file("res://Cinematicas/Cinematica5.tscn")
	
	if Input.is_key_pressed(KEY_SHIFT) and Input.is_key_pressed(KEY_K):
		get_tree().change_scene_to_file("res://Escenas/menu y selector/menu.tscn")

	

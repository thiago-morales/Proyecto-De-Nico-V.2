extends CanvasLayer
var coins = 0 

func _ready() -> void:
	var coinNode = get_tree().get_root().find_node("Coin2D", true, false)
	coinNode.connect("coinColeected",self,"handleCoinColeected")
	
	$puntuacion.text = String(coins)

func handleCoinColeected():
	print("Coin Collected")
	coins =+ 1
	$puntuacion.text= String(coins)

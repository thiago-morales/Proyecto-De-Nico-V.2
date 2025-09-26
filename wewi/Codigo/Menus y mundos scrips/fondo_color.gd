extends CanvasModulate

@onready var timer := Timer.new()

func _ready():
	add_child(timer)
	timer.wait_time = 1.75
	timer.one_shot = false
	timer.autostart = true
	timer.connect("timeout", Callable(self, "_on_timer_timeout"))
	timer.start()

func _on_timer_timeout():
	visible = not visible

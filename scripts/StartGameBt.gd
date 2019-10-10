extends Button


func _ready():
	var game =get_node("/root/Game")
	connect("pressed", game, "start_bt_pressed")

#func is_pressed:
	
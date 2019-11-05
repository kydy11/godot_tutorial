extends Button

func _ready():
	var game =get_node("/root/Game")
	connect("pressed", game, "continue_bt_pressed")
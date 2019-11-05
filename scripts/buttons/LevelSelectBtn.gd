extends Button

func _ready():
	var game =get_node("/root/Game")
	connect("pressed", game, "level_select_bt_pressed")
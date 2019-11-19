extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var player
var game
signal player_entered_finish

# Called when the node enters the scene tree for the first time.
func _ready():
	player =get_node("/root/Game/Node2D/Player")
	game =get_node("/root/Game")
	connect("body_entered", self, "on_body_entered")
	connect("player_entered_finish", game, "enter_finish")

func on_body_entered(body):
	if (body == player):
		emit_signal("player_entered_finish")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

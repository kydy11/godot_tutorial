extends Area2D

var player
var game
signal hit_boundry

func _ready():
	player =get_node("/root/Game/Node2D/Player")
	game =get_node("/root/Game")
	connect("body_entered", self, "on_body_entered")
	connect("hit_boundry", game, "hit_boundry")
	
	
func on_body_entered(body):
	if body ==player:
		emit_signal("hit_boundry")
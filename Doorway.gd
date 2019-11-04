extends Area2D

var id

var player
var game

signal enteredDoorway(doorid)

func _init():
	id =doorID.assign_id(self.get_path(), self.get_position())

func _ready():
	player =get_node("/root/Game/Node2D/Player")
	game = get_node("/root/Game")
	
	connect("body_entered", self, "on_body_entered")
	connect("enteredDoorway", game, "enter_door")

func on_body_entered(body):
	if(body ==player):
		emit_signal("enteredDoorway", id)
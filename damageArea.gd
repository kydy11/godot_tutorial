extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal damege_player(amount)

# Called when the node enters the scene tree for the first time.
func _ready():
	var player =get_node("/root/Node2D/Player")
	connect("body_entered", self, "on_body_entered")
	connect("damege_player", player , "recieve_damege")
func on_body_entered(body):
	emit_signal("damege_player", 2)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _physics_process(delta):
#	if body
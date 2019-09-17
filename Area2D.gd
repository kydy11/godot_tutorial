extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
    connect("body_entered", self, "on_body_entered_stuff")
func on_body_entered_stuff(body):
	print("stuff")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


#func _physics_process(delta):
#	if body
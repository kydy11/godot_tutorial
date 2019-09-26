extends Node2D

var currantLevel
#var testLevel
var testLevel = preload("res://testLevel.tscn")
var menu = preload("res://menu.tscn")

func _ready():
	currantLevel =testLevel.instance()
	add_child(currantLevel)

func hit_boundry():
	change_scene(menu)

func change_scene(scene):
	remove_child(currantLevel)
	currantLevel =scene.instance()
	add_child(currantLevel)

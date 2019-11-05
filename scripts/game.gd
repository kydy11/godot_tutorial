extends Node2D

class Level:

	var levelScene #scene
	var levelInstance
	var levelNumb #int
	
	
	func _init(scene, numb):
		levelNumb =numb
		levelScene =scene
		levelInstance =levelScene.instance()
	
	func reset_scene():
		levelInstance =levelScene.instance()
	
	#func set_levelScene(newScene):
	#	levelScene =newScene
	
	#func set_levelNumb(newNumb):
	#	levelNumb =newNumb
	
	
	
	
	func get_level_instance():
		return levelInstance
	
	func get_level_numb():
		return levelNumb



#var level =preload("res://level.gd")

var currantLevel
var lastLevel

var testLevel
var menu
var level2
var deathMenu
var levelSelect
var level3
var exampleLevel
var level4

var player


func _ready():
	testLevel = Level.new(load("res://scenes/testLevel.tscn"), 1)
	menu =Level.new(load("res://scenes/menu.tscn"), 10)
	level2 =Level.new(load("res://scenes/scene2.tscn"), 11)
	deathMenu =Level.new(load("res://scenes/deathMenu.tscn"),100)
	level3 =Level.new(load("res://scenes/level3.tscn"),101)
	exampleLevel =Level.new(load("res://scenes/exampleScene.tscn"),110)
	level4 =Level.new(load("res://scenes/level4.tscn"),111)
	levelSelect =Level.new(load("res://scenes/LevelSelectMenu.tscn"),1000)
	
	#testLevel = testLevel.newLevel(load("res://scenes/testLevel.tscn"), 1)
	#menu =menu.newLevel(load("res://scenes/menu.tscn"), 10)
	#level2 =level2.newLevel(load("res://scenes/scene2.tscn"), 11)
	
	currantLevel =menu
	add_child(currantLevel.get_level_instance())

func change_scene(scene):
	
	currantLevel.get_level_instance().call_deferred("free")
	lastLevel=currantLevel
	currantLevel =scene
	currantLevel.reset_scene()
	call_deferred("add_child", currantLevel.get_level_instance())


func enter_finish():
	if currantLevel.get_level_numb() == testLevel.get_level_numb():
		change_scene(level2)
	elif currantLevel.get_level_numb() == level2.get_level_numb():
		change_scene(level3)
	elif currantLevel.get_level_numb() == level3.get_level_numb():
		change_scene(exampleLevel)
	elif currantLevel.get_level_numb() == exampleLevel.get_level_numb():
		change_scene(level4)
	elif currantLevel.get_level_numb() == level4.get_level_numb():
		change_scene(menu)

var inDoor =false
func enter_door(id):
	player =get_node("/root/Game/Node2D/Player")
	if(inDoor):
		inDoor =false
	else:
		inDoor =true
		var linkedDoorId
		if(id%2==0):
			linkedDoorId =id+1
		else:
			linkedDoorId =id-1
		var linkedPos =doorID.get_door_pos(linkedDoorId)
		player.set_position(linkedPos)
		
	

####### simple signals
func hit_boundry():
	change_scene(deathMenu)

func start_bt_pressed():
	change_scene(testLevel)

func level_select_bt_pressed():
	change_scene(levelSelect)

func level2_bt_pressed():
	change_scene(level2)
func level3_bt_pressed():
	change_scene(level3)
func level4_bt_pressed():
	change_scene(exampleLevel)
func level5_bt_pressed():
	change_scene(level4)

func to_menu():
	change_scene(menu)

func handle_death():
	change_scene(deathMenu)

func continue_bt_pressed():
	change_scene(lastLevel)
	
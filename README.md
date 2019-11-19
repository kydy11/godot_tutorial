# Start project:
When godot opens push new project (right side) <br>
Select browse <br>
Create a new folder called "godot" <br>
Create a folder with the name you want for your game <br>
Push select current folder <br>
Name your project <br>


# Objects:
select custom node (left). <br>
Create a KinematicBody, StaticBody, or Area2D. <br>
Add a sprite and a CollisionShape2D to that. <br>
Add a texture to the sprite.  (load it from resources) <br>
![](https://github.com/kydy11/godotThing/blob/master/totorialImages/texture.png) <br>
In collision shape add a shape. <br>
![](https://github.com/kydy11/godotThing/blob/master/totorialImages/shape%20add.png) <br>
Click on the shape, set it's extend/radius/other, to set its size. <br>
![](https://github.com/kydy11/godotThing/blob/master/totorialImages/collision%20size.png) <br>
On sprite, in transform adjust scale to the size you want. <br>
![](https://github.com/kydy11/godotThing/blob/master/totorialImages/transform.png) <br>
On the kinematicBody, StaticBody, or Area2D.  Adjust scale to change the overall size, rather than the size of an individual part. <br>
Save it in a folder (probably named "objects") <br> <br>

Use this method to create several objects including your player and platform objects.


# Scenes:
###### all code in this section can be found in scripts/game.gd.
Your game will be made up of scenes.<br>
I suggest you have one base scene that runs your other scenes using script. <br>
Create a new scene called "game" or "base". <br>
![](https://github.com/kydy11/godotThing/blob/master/totorialImages/new%20scene.png) <br>
Go to project settings, in run, change the main scene to your base scene.<br>
![](https://github.com/kydy11/godotThing/blob/master/totorialImages/project.png) <br>
![](https://github.com/kydy11/godotThing/blob/master/totorialImages/change%20main%20scene.png) <br>
In the base scene script:<br>
Either make a variable for each scene and load them in the ready function.  Make a currant scene variable.  In &#95;ready set currant scene to one of your scenes, use: ```add_child(currantScene.instance())```
<br>
or use a class:
```python
class Level:

	var levelScene #scene
	var levelInstance #instance of scene
	var levelNumb #int
	
	
	func _init(scene, numb):
		levelNumb =numb
		levelScene =scene
		levelInstance =levelScene.instance()
	
	func reset_scene():
		levelInstance =levelScene.instance()	
	
	func get_level_instance():
		return levelInstance
	
	func get_level_numb():
		return levelNumb
```

create variables for each scene and a currant scene variable. in &#95;ready set the scene variables to Level.new() with the parameters of the loaded scene and whatever number you want to assign to that scene. (to load a scene use ```load( scenePath)```) <br>
ex. ```level2 = Level.new( load("res://scenes/level2.tscn"), 10)``` <br>
set the currant scene to one of the other scenes, and use: ```add_child(currantScene.get_level_instance())```
<br>
<br>
Make a function to change scenes, have it take the scene to change to as a parameter. <br>
Use ```(scene instance).call_deferred("free")``` to remove a scene, then ```call_deferred("add_child", (scene instance) )``` to add a new one.<br>
ex.
```python
func change_scene(scene):
	currantLevel.get_level_instance().call_deferred("free")
	lastLevel =currantLevel
	currantLevel =scene
	currantLevel.reset_scene()
	call_deferred("add_child", currantLevel.get_level_instance())
```
<br>

Create a new scene for your first level. Select node2D. <br>
Build your levels out of objects. <br>
You can add an object to your scene with this button: <br>
![](https://github.com/kydy11/godotThing/blob/master/totorialImages/connect%20scene.png) <br>
Use the objects you have made and create new objects as you need them to build this level. <br> <br>

Example of a level built from objects: <br>
![](https://github.com/kydy11/godotThing/blob/master/totorialImages/scene%20of%20objects.PNG) <br>

# Input map:

the input map lets you name types of input and assign things to them   ex. You could assign ‘w’ and UP to the name “up” and use that name in the script for jumping rather than using keycodes.

To adjust your imput map go to project settings <br>
Go to Input map


Alternative to Input map that's kind of worse: Keycodes in godot
https://github.com/godotengine/godot/blob/master/core/os/keyboard.h


# 2D platformer movement:
Add a script to the kinematic body of the player object. <br>
make a variable set to Vector2() (```var velocity = Vector2()```) <br>
make a variable for gravity<br>
use ```func _physics_process(delta):``` <br>
Use ```if Input.is_action_pressed(“ --whatever you named the input in input map-- ”):```<br>
Use += or -= for acceleration and = for constant velocity<br>
delta is how often the function is called<br>
For jumping use:   
```
if Input.is_action_just_pressed("up") && velocity.y==0:
	velocity.y =jumpHeight
```
At the end of the physics function use: <br>
```python
Velocity.y +=gravity *delta

if move_and_slide(velocity/2)[1]==0:
	velocity.y =0
if move_and_slide(velocity/2)[0]==0:
	velocity.x =0
```
To account for gravity, move the object, and reset velocity when it collides.<br>



# Area collisions:
Standard collisions are automatically handled stopping movement, but if you need a collision with a different effect, for example doing damage or triggering an effect, you should use areas.<br>
Anything that you want to have a special collision add a area2D to.<br>
Add a collision shape to the area, set it up the same way as previous collision shapes.<br>
Add a script to the aree.<br>
In the _ready function, put connect().<br>
The first parameter in connect is what you want to be detected. For example, if you want to detect a body entering use "body_entered", if you want to detect an area exiting use "area_exited".<br>
The second parameter should most always be self.
The third parameter is the name of the function you want activated by something entering or exiting. For example you could name something "on_body_enter".<br>

ex.
```python
func _ready():
    connect("body_entered", self, "on_body_entered")
func on_body_entered(body):
	print("stuff")
```


# Signals:
Signals let you easily call functions from other scripts.<br>
to use a signal first make a signal variable.
```python
signal damege_player(amount)
```
in ```func _ready():``` set a variable equal to the node you want this script to send signals to, using ```get_node(nodepath)```.
then connect it using ```connect("signalName", nodeYouAreSignaling, "nameOfFunctionToCall")``` <br>
Use ```emit_signal("signalName", anyParameters)``` to send the signal. <br>

ex.
```python
extends Area2D

signal damege_player(amount)

func _ready():
	var player =get_node("/root/Node2D/Player")
	connect("body_entered", self, "on_body_entered")
	connect("damege_player", player , "recieve_damege")
func on_body_entered(body):
	emit_signal("damege_player", 2)
```
with:
```python
func recieve_damege(amount):
	health-=amount
```
in the other script.

you can get the nodePath of a node by putting ``` print(self.get_path()) ```
in its ready script.


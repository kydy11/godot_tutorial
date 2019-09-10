
List of keycodes in godot: (I would use the input map instead)
https://github.com/godotengine/godot/blob/master/core/os/keyboard.h



# Input map:

the input map lets you name types of input and assign things to them   ex. You could assign ‘w’ and UP to the name “up” and use that name in the script rather than using keycodes

Push project(top left)<br>   
project settings<br>
Input map



# 2D objects:
Add (top left) kinamaticBody2D<br>
Add to that a sprite and a CollisionShape2D<br>
Add a texture to the sprite (otherwise it’s invisible)


# 2D platformer movement:
Add a script to the kinamatic body<br>
make a variable set to Vector2() (var velocity = Vector2() )<br>
make a variable for gravity<br>
use func _physics_process(delta): <br>
Use if Input.is_action_pressed(“ --whatever you named the input in input map-- ”):<br>
Use += / -= for acceleration and = for constant velocity<br>
delta is how often the function is called<br>
Ex.<br>
```python
If Input.is_action_pressed(“left”):
	velocity.x = -moveSpeed

Velocity.y +=gravity *delta
```
For jumping use:   if Input.is_action_just_pressed("up") && velocity.y==0:<br>

At the end of the physics function use: <br>
```python
if move_and_slide(velocity/2)[1]==0:
	velocity.y =0
if move_and_slide(velocity/2)[0]==0:
	velocity.x =0
```
To move the object and reset velocity when it collides<br>



# Animation:
Push the plus top left<br>
Add animation player<br>

Add sprite to player<br>

With player selected push “animation” bottom middle, select new<br>

Push add track to the animation you made. Select “property track”v<br>
Select the sprite, select the property you want to adjust (probably position)<br>

Right click in the position row under the timeline, push “add key”<br>
Add a second key.<br>
The first ‘key’ has the starting position, the second has the ending position.<br>



# Physics
func _physics_process(delta):         Is a loop

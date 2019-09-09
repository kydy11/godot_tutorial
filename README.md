
List of keycodes in godot: (use the input map instead)
https://github.com/godotengine/godot/blob/master/core/os/keyboard.h


the input map lets you name types of input and assign things to them   ex. You could assign ‘w’ and UP to the name “up” and use that name in the script rather than using keycodes

# Input map:

Push project(top left)   
project settings
Input map



# 2D objects:
Add (top left) kinamaticBody2D
Add to that a sprite and a CollisionShape2D
Add a texture to the sprite (otherwise it’s invisible)


# 2D platformer movement:
Add a script to the kinamatic body
make a variable set to Vector2() (var velocity = Vector2() )
make a variable for gravity
use func _physics_process(delta): 
Use if Input.is_action_pressed(“ --whatever you named the input in input map-- ”):
Use += / -= for acceleration and = for constant velocity
delta is how often the function is called
Ex.
If Input.is_action_pressed(“left”):
	velocity.x = -moveSpeed

Velocity.y +=gravity *delta

For jumping use:   if Input.is_action_just_pressed("up") && velocity.y==0:

At the end of the physics function use: 
if move_and_slide(velocity/2)[1]==0:
	velocity.y =0;
if move_and_slide(velocity/2)[0]==0:
	velocity.x =0;
To move the object and reset velocity when it collides





# Animation:
Push the plus top left
Add animation player

Add sprite to player

With player selected push “animation” bottom middle, select new

Push add track to the animation you made. Select “property track”
Select the sprite, select the property you want to adjust (probably position)

Right click in the position row under the timeline, push “add key”
Add a second key.
The first ‘key’ has the starting position, the second has the ending position.



# Physics
func _physics_process(delta):         Is a loop

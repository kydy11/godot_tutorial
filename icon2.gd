extends KinematicBody2D

const METERS =300;
const GRAVITY =9.8;

var moveSpeed =1;
var jumpHight =4;
var jumpTime =1;
var currantJumpTime =0;
var hasJumbed =false;

var velocity = Vector2()


func _physics_process(delta):
	
	if Input.is_action_pressed("left"):
		velocity.x = -moveSpeed *METERS;
	elif Input.is_action_pressed("right"):
		velocity.x = moveSpeed *METERS;
	else:
		velocity.x =0;
	
	if Input.is_action_just_pressed("up") && velocity.y==0:
		currantJumpTime=jumpTime;
	
	if currantJumpTime>0:
		velocity.y -= (jumpHight/jumpTime) *currantJumpTime *METERS;
		currantJumpTime-=1;
	
	
	velocity.y += delta * GRAVITY * METERS;
	
	if move_and_slide(velocity/2)[1]==0:
		velocity.y =0;
	if move_and_slide(velocity/2)[0]==0:
		velocity.x =0;

extends KinematicBody2D

const METERS =300;
const GRAVITY =9.8;

var moveSpeed =0.2;
var maxMoveSpeed =2;
var jumpHight =4;
var jumpTime =1;
var currantJumpTime =0;
var health =8;

var velocity = Vector2()
signal player_died

func _ready():
	var game =get_node("/root/Game")
	connect("player_died", game , "handle_death")
	

func _physics_process(delta):
	
	if Input.is_action_pressed("left")&& velocity.y==0:
		velocity.x += -moveSpeed *METERS;
	elif Input.is_action_pressed("right")&& velocity.y==0:
		velocity.x += moveSpeed *METERS;
	elif velocity.x<0:
		if velocity.y!=0:
			velocity.x +=0.02 *METERS;
		else:
			velocity.x +=0.1 *METERS;
		if velocity.x > -0.02 *METERS:
			velocity.x=0;
	elif velocity.x>0:
		if velocity.y!=0:
			velocity.x -=0.02 *METERS;
		else:
			velocity.x-=0.1*METERS
		if velocity.x < 0.02 *METERS:
			velocity.x=0;

	
	if Input.is_action_just_pressed("up") && velocity.y==0:
		currantJumpTime=jumpTime;
		if Input.is_action_pressed("left"):
			velocity.x += -moveSpeed*jumpHight *METERS;
			if velocity.x > -maxMoveSpeed *METERS:
				velocity.y += moveSpeed*METERS;
		if Input.is_action_pressed("right"):
			velocity.x += moveSpeed * jumpHight *METERS;
			if velocity.x < maxMoveSpeed *METERS:
				velocity.y += moveSpeed*METERS;
			
	
	if velocity.x>maxMoveSpeed*METERS:
		velocity.x=maxMoveSpeed*METERS
	elif velocity.x<-maxMoveSpeed*METERS:
		velocity.x=-maxMoveSpeed*METERS
	
	
	if currantJumpTime>0:
		velocity.y -= (jumpHight/jumpTime) *currantJumpTime *METERS;
		currantJumpTime-=1;
	
	
	velocity.y += delta * GRAVITY * METERS;
	
	if move_and_slide(velocity/2)[1]==0:
		velocity.y =0;
	if move_and_slide(velocity/2)[0]==0:
		if velocity.x >0:
			velocity.x = 0.05 *METERS;
		elif velocity.x <0:
			velocity.x = -0.05 *METERS;
		elif velocity.x == 0:
			velocity.x = 0

func recieve_damege(amount):
	health-=amount
	if(health <=0):
		emit_signal("player_died")
	

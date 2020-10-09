extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 15
const SPEED = 200
const JUMP_SPEED = -500
var motion = Vector2()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	motion.y += GRAVITY; # adding gravity
	if Input.is_action_pressed("ui_right"):
		motion.x = SPEED
	elif Input.is_action_pressed("ui_left"):
		motion.x = -SPEED
	else:
		motion.x = 0
	
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_SPEED
			
	motion = move_and_slide(motion, UP) #updating motion to make gravity look more normal

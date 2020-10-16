extends KinematicBody2D

const UP = Vector2(0,-1)
var motion = Vector2()
var hasKey = false
var spawnpoint = get_position() + Vector2(200,200)
func _ready():
	spawnpoint = get_position() 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	motion.y += 9.81; # adding gravity
	if Input.is_action_pressed("ui_right"):
		motion.x += 25
	elif Input.is_action_pressed("ui_left"):
		motion.x += -25
	else:
		motion.x = motion.x * 0.95
	if motion.x > 400:
		motion.x = 400
	elif motion.x < -400:
		motion.x = -400
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -400
	if motion.x > 0:
		get_node("icon").flip_h = false
	elif motion.x < 0:
		get_node("icon").flip_h = true
			
	motion = move_and_slide(motion, UP) #updating motion to make gravity look more normal
	pass


func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		motion.x = 0
		motion.y = 0
		set_position(spawnpoint)
	if body.is_in_group("Key"):
		body.queue_free()
		hasKey = true
	pass 

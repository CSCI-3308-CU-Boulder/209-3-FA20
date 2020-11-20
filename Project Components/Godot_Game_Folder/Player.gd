extends KinematicBody2D

const UP = Vector2(0,-1)
var motion = Vector2()
var hasKey = false
var spawnpoint = get_position() + Vector2(200,200)
var total_score = 0
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
		# Allow player to jump while moving right or left, or while standing still
		if Input.is_action_just_pressed("ui_up") || (Input.is_action_just_pressed("ui_up") && Input.is_action_pressed("ui_left")) || (Input.is_action_just_pressed("ui_up") && Input.is_action_pressed("ui_right")):
			motion.y = -400
	if motion.x > 0:
		get_node("icon").flip_h = false
	elif motion.x < 0:
		get_node("icon").flip_h = true
			
	motion = move_and_slide(motion, UP) #updating motion to make gravity look more normal
	if(get_position().y > 700):
		set_position(spawnpoint)
	pass


func _on_body_entered(body):
	if body.is_in_group("Enemy"):
		motion.x = 0
		motion.y = 0
		set_position(spawnpoint)
	if body.is_in_group("Key"):
		total_score += 10 # test value
		body.queue_free()
		hasKey = true
		get_tree().paused = true
		get_node("LevelComplete").show()
	pass 

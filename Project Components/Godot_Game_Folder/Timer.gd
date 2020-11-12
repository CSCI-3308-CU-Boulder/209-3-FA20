extends Label

var time = 0.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time+=delta
	# display time to the hundredth place
	text = "Time: " + str(stepify(get_time(),.01))
	pass
	
func get_time():
	return time
	
func increment_time():
	time = time + 5.0

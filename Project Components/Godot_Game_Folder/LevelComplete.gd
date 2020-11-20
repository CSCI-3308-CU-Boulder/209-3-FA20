extends PopupMenu


var time = 0.0
	
func _ready():
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time+=delta
	pass
	
func get_time():
	return time

func _setupPopupMenu():
	self.add_item(str(stepify(get_time(),.01), 0))
	self.show()

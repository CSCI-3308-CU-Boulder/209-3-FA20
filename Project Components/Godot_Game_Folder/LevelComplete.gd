extends Control

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
	#self.add_item("You completed the level in " + str(stepify(get_time(),.01), 0) + " seconds!")
	get_child(1).get_child(0).get_child(0).text = "The COVID-19 cure teleported to another world! Go find it!\nLevel 1 Time: " + str(stepify(get_time(),.01), 0) + " seconds"
	self.show()

# Go to next level and unpause game
func _on_NextLevelButton_pressed():
	get_tree().change_scene("res://world2.tscn")
	get_tree().paused = not get_tree().paused 

# Go back to title screen and unpause game
func _on_ToTitleButton_pressed():
	get_tree().change_scene("res://title_screen/TitleScreen.tscn")
	get_tree().paused = not get_tree().paused 

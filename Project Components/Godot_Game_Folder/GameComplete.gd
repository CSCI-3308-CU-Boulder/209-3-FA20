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
	get_child(1).get_child(0).get_child(0).text = "You found the cure! 2020 is saved!\nLevel 2 Time: " + str(stepify(get_time(),.01), 0) + " seconds"
	self.show()

# Go back to title screen and unpause game
func _on_ToTitleButton_pressed():
	get_tree().change_scene("res://title_screen/TitleScreen.tscn")
	get_tree().paused = not get_tree().paused 

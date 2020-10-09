extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func request_ready():
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	$Menu/CenterRow/Buttons/NewGame.grab_focus()
	
func _on_NewGame_pressed():
	get_tree().change_scene("res://title_screen/Game/NewGame.tscn")

func _on_LoadGameButton_pressed():
	get_tree().change_scene("res://title_screen/Game/LoadGame.tscn")


func _on_SettingsButton_pressed():
	get_tree().change_scene("res://title_screen/Game/Settings.tscn")
	
func _on_QuitButton_pressed():
	get_tree().quit()

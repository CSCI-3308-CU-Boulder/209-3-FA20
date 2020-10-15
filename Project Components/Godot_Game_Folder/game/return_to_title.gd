extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://title_screen/TitleScreen.tscn")


func _on_MusicVolumeSlider_value_changed(value):
	if (value == -24):
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

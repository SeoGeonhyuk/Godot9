extends Control


onready var bgm = $BGM

func _ready():
	bgm.play()
	
func _on_MusicButton_pressed():
	if bgm.is_playing():
		$Music/AudioOn.visible = false
		$Music/AudioOff.visible = true
		bgm.stop()
	else:
		$Music/AudioOn.visible = true
		$Music/AudioOff.visible = false
		bgm.play()



func _on_PlayButton_pressed():
	get_tree().change_scene("res://WorldSelection/WorldSelection.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()

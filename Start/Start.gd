extends Control


onready var bgm = SoundManager.title_music_list
var musicPaused = false
var temp = 0

func _ready():
	bgm.play()
	
func _on_MusicButton_pressed():
	if musicPaused == false:
		temp = bgm.get_playback_position()
		$Music/AudioOn.visible = false
		$Music/AudioOff.visible = true
		bgm.stop()
		musicPaused = true
	else:
		$Music/AudioOn.visible = true
		$Music/AudioOff.visible = false
		bgm.play(temp)
		musicPaused = false




func _on_PlayButton_pressed():
	bgm.stop()
	get_tree().change_scene("res://jungleground.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()

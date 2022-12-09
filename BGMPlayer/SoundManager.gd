extends Node2D

#singleton

onready var music_list = $Music
onready var title_music_list = $Music/TitleScreenBGM
onready var GamePlay_music_list = $Music/GamePlayMusic
onready var Ending_music_list = $Music/EndingMusic

onready var Jump_sound = $SoundEffect/jump
onready var Button_up = $SoundEffect/Buttonup
func update_sound_volume(value, vol_range, type):
	match type:
		"Music":
			pass
		"SoundEffect":
			pass

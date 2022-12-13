extends Node2D

onready var resultbgm = SoundManager.result_music_list

func _ready():
	resultbgm.play()


func _on_NextButton_pressed():
	resultbgm.stop()
	get_tree().change_scene("res://ending/ending screen.tscn")

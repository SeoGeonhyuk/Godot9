extends Node2D

onready var gamebgm = SoundManager.GamePlay_music_list

func _ready():
	gamebgm.play()
	
#func enter_tree():
#	if Checkpoint.last_position:
#		$Player.global_position = Checkpoint.last_position


func _on_crowns_body_entered(body):
	SignalBus.changeSceneFrom = get_name()
	gamebgm.stop()
	get_tree().change_scene("res://ResultScreen/result.tscn")

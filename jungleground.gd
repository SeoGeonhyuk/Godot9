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
	## player1 screenchange
	if body == $Player:
		SignalBus.Player1Score += 1
		get_tree().change_scene("res://ResultScreen/Win1.tscn")
	elif body == $Player2:
		get_tree().change_scene("res://ResultScreen/Lose1.tscn")

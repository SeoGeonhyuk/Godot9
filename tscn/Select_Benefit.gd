extends Control

var lose_player = null

func _ready():
	SoundManager.Button_up.play()
	$AnimationPlayer.play("buttonup")




func _on_SpeedButton_pressed():
	lose_player.Run_ben = true


func _on_ShieldButton_pressed():
	lose_player.shiled += 1


func _on_JumpButton_pressed():
	lose_player.Jump_ben = true


# 게임 끝나면 시그널 받아서 진 플레이어 받아오기

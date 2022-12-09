extends Control

func _ready():
	SoundManager.Button_up.play()
	$AnimationPlayer.play("buttonup")

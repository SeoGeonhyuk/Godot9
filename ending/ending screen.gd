extends Control


var counter = 0
var scroll_speed : int = 10
onready var run_animation = $CenterContainer/AnimatedSprite

var credit_list = [
	["Made by","Seogeonhyuk"],
	["Made by","Hyeonhongseok"],
	["Made by","kimkyeongyeon"],
	["Background Music","Imagine dragons - Borns(remix)"],
	["Ending Music","Rihanna - Born Again"],
	["Font","esamanru Bold"],
	["Thank you","CMP"],
	["Thank you","Teemu"],
]

func _ready() -> void:
	$Timer.start()
	run_animation.flip_h = true
	SoundManager.Ending_music_list.play()

	
func _process(delta:float) -> void:
	$ParallaxBackground/ParallaxLayer.motion_offset.x -= scroll_speed *delta
	run_animation.play("RunRight")

func _on_Timer_timeout():
	$VBoxContainer/Title.text = credit_list[counter][0]
	$VBoxContainer/Name.text = credit_list[counter][1]
	$AnimationPlayer.play("FadeInOut")
	counter += 1
	if counter == credit_list.size() :
		$Timer.stop()
		

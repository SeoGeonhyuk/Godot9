extends Control

signal score_added
var nextScene
onready var resultbgm = SoundManager.result_music_list

func _ready():
	resultbgm.play()
	$selection.position = Vector2(840,130)
	SignalBus.connect("jungle_ended", self, "_jungle_ended")
	SignalBus.connect("lava_ended", self, "_lava_ended")
	SignalBus.connect("ice_ended", self, "_ice_ended")

	if (SignalBus.changeSceneFrom == "jungleground"):
		SignalBus.arrive_result_scene("jungleground")
		emit_signal("score_added")
	if (SignalBus.changeSceneFrom == "lavaground"):
		SignalBus.arrive_result_scene("lavaground")
		emit_signal("score_added")
	if (SignalBus.changeSceneFrom == "iceground"):
		SignalBus.arrive_result_scene("iceground")
		emit_signal("score_added")
		
func _input(event):
	if ($Item/killbutton.is_hovered()):
		$selection.position.y = 130
	if ($Item/shiedbutton.is_hovered()):
		$selection.position.y = 239
	if ($Item/speedbutton.is_hovered()):
		$selection.position.y = 329
	if ($Item/jumpbutton.is_hovered()):
		$selection.position.y = 428

func _jungle_ended():
	$junglestage.visible = true
	$lavastage.visible = false
	$icestage.visible = false
	SignalBus.clear_changeSceneFrom()
	nextScene = "lava"

func _lava_ended():
	$junglestage.visible = false
	$lavastage.visible = true
	$icestage.visible = false
	SignalBus.clear_changeSceneFrom()
	nextScene = "ice"

func _ice_ended():
	$junglestage.visible = false
	$lavastage.visible = false
	$icestage.visible = true
	SignalBus.clear_changeSceneFrom()
	nextScene = "finalScore"



func _on_NextButton_pressed():
	resultbgm.stop()
	if nextScene == "lava":
			get_tree().change_scene("res://lavaground.tscn")
	if nextScene == "ice":
			get_tree().change_scene("res://iceground.tscn")
	if nextScene == "finalScore":
		if SignalBus.Player1Score > SignalBus.Player2Score:
			get_tree().change_scene("res://ResultScreen/FinalScore1.tscn")
		elif SignalBus.Player1Score < SignalBus.Player2Score:
			get_tree().change_scene("res://ResultScreen/FinalScore2.tscn")


func _on_killbutton_pressed():
	pass # Replace with function body.


func _on_shiedbutton_pressed():
	pass # Replace with function body.


func _on_speedbutton_pressed():
	pass # Replace with function body.


func _on_jumpbutton_pressed():
	pass # Replace with function body.

extends Node2D

signal score_added
var nextScene

func _ready():
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

		
#if lose:
#	$win/win.visible = false
#	$win/Crown.visible = false
#	$lose/lose.visible = true


func _on_NextButton_pressed():
	if nextScene == "lava":
			get_tree().change_scene("res://lavaground.tscn")
	if nextScene == "ice":
			get_tree().change_scene("res://iceground.tscn")
	if nextScene == "finalScore":
			pass

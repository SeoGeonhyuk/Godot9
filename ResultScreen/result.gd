extends Node2D


func _ready():
	SignalBus.connect("jungle_ended", self, "_jungle_ended")
	SignalBus.connect("lava_ended", self, "_lava_ended")
	SignalBus.connect("ice_ended", self, "_ice_ended")

	if (SignalBus.changeSceneFrom == "jungleground"):
		SignalBus.arrive_result_scene("jungleground")
	if (SignalBus.changeSceneFrom == "lavaground"):
		SignalBus.arrive_result_scene("lavaground")
	if (SignalBus.changeSceneFrom == "iceground"):
		SignalBus.arrive_result_scene("iceground")

func _jungle_ended():
	$junglestage.visible = true
	$lavastage.visible = false
	$icestage.visible = false
	SignalBus.clear_changeSceneFrom()
	
func _lava_ended():
	$junglestage.visible = false
	$lavastage.visible = true
	$icestage.visible = false
	SignalBus.clear_changeSceneFrom()
	
func _ice_ended():
	$junglestage.visible = false
	$lavastage.visible = false
	$icestage.visible = true
	SignalBus.clear_changeSceneFrom()
	
#if lose:
#	$win/win.visible = false
#	$win/Crown.visible = false
#	$lose/lose.visible = true
#

extends Node2D


func _ready():
	SignalBus.connect("jungle_ended",self,"_jungle_ended")
	SignalBus.connect("lava_ended",self,"_lava_ended")
	SignalBus.connect("ice_ended",self,"_ice_ended")
	
func _jungle_ended():
	$worlds/Jungle.visible = true
	$worlds/Fire.visible = false
	$worlds/Ice.visible = false
	
func _lava_ended():	
	$worlds/Jungle.visible = false
	$worlds/Fire.visible = true
	$worlds/Ice.visible = false
func _ice_ended():
	$worlds/Jungle.visible = false
	$worlds/Fire.visible = false
	$worlds/Ice.visible = true

#if lose:
#	$win/win.visible = false
#	$win/Crown.visible = false
#	$lose/lose.visible = true
#

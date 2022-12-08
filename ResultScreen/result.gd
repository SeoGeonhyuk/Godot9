extends Node2D


func _ready():
	SignalBus.connect("jungle_ended",self,"_jungle_ended")
	SignalBus.connect("lava_ended",self,"_lava_ended")
	SignalBus.connect("ice_ended",self,"_ice_ended")
	
func _jungle_ended():
	$world/Jungle.visible = true
	$world/Fire.visible = false
	$world/Ice.visible = false
	
func _lava_ended():	
	$world/Jungle.visible = false
	$world/Fire.visible = true
	$world/Ice.visible = false
	
func _ice_ended():
	$world/Jungle.visible = false
	$world/Fire.visible = false
	$world/Ice.visible = true

#if lose:
#	$win/win.visible = false
#	$win/Crown.visible = false
#	$lose/lose.visible = true
#

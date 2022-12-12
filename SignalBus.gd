extends Node

# signal전역변수

signal jungle_ended
signal lava_ended
signal ice_ended

var Player1win = false
var Player2win = false
var Player1Score = 0
var Player2Score = 0

var changeSceneFrom = null

func arrive_result_scene(changeSceneFrom):
	if (changeSceneFrom=="jungleground"):
		emit_signal("jungle_ended")
	elif (changeSceneFrom=="lavaground"):
		emit_signal("lava_ended")
	elif (changeSceneFrom=="iceground"):
		emit_signal("ice_ended")

func clear_changeSceneFrom():
	changeSceneFrom = null
	
func _ready():
	pass 

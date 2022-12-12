extends Node2D


#func enter_tree():
#	if Checkpoint.last_position:
#		$Player.global_position = Checkpoint.last_position


func _on_Node2D_die():
	$Player.global_position = Checkpoint.last_position


func _on_crowns_body_entered(body):
	SignalBus.changeSceneFrom = get_name()
	get_tree().change_scene("res://ResultScreen/result.tscn")

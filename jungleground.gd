extends StaticBody2D


#func enter_tree():
#	if Checkpoint.last_position:
#		$Player.global_position = Checkpoint.last_position


func _on_crowns_body_entered(body):
	SignalBus.emit_signal("jungle_ended")
	get_tree().change_scene("res://ResultScreen/result.tscn")


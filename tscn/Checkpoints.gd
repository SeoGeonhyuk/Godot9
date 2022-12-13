extends Area2D







#func _on_flag_body_entered(body):	
#	Checkpoint.last_position = global_position





func _on_Area2D_body_entered(body):
	if body.name == "Player":
		CheckP.Player1_last_position = global_position
	elif body.name == "Player2":
		CheckP.Player2_last_position = global_position

extends StaticBody2D


#func enter_tree():
#	if Checkpoint.last_position:
#		$Player.global_position = Checkpoint.last_position



func _on_Node2D_die():
	$Player.global_position = Checkpoint.last_position

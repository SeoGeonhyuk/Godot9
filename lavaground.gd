extends StaticBody2D


func enter_tree():
	if Checkpoint.last_position:
		$Player.global_position = Checkpoint.last_position


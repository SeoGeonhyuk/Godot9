extends StaticBody2D

signal jungle_ended

#func enter_tree():
#	if Checkpoint.last_position:
#		$Player.global_position = Checkpoint.last_position


func _on_crowns_body_entered(body):
	emit_signal("jungle_ended")


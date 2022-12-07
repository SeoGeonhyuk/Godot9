extends Area2D



func _on_checkpoint_body_entered(body):
	Checkpoint.last_position = global_position
	queue_free()

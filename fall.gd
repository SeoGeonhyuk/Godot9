extends Area2D





func _on_fall_body_entered(body):
	print(1)
	get_tree().reload_current_scene()

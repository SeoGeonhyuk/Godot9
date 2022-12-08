extends Area2D

signal die



func _on_fall_body_entered(body):
	print(1)
	emit_signal("die")

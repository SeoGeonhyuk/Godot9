extends Area2D

signal die

func _on_fall_body_entered(body):
	emit_signal("die")

extends Area2D

func _on_balls_body_entered(body):
	SignalBus.emit_signal("die")


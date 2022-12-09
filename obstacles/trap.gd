extends Area2D

signal die_trap

func _on_traps_body_entered(body):
	emit_signal("die_trap")

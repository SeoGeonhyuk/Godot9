extends Area2D

signal Player1_die_trap
signal Player2_die_trap

func _on_traps_body_entered(body):
	if body.name == "Player":
		emit_signal("Player_die_trap")
	elif body.name == "Player2":
		emit_signal("Player2_die_trap")

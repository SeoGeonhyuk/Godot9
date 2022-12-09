extends Area2D

signal Player1_die
signal Player2_die

func _on_fall_body_entered(body):
	if body.name == "Player":
		emit_signal("Player1_die")
	elif body.name == "Player2":
		emit_signal("Player2_die")

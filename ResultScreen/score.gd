extends Label


func _ready():
	text = "SCORE = " + str(SignalBus.Player1Score)
	

func _on_result_score_added():
	_ready()

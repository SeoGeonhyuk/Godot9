extends Control

func _ready():
	$"1p\'s_select".position = Vector2(660,290)
	$"2p\'s_select".position = Vector2(365,290)

func _input(event):
	if ($"2p\'s_world/2pIceButton".is_hovered()):
		$"1p\'s_select".position.y = 290
	if ($"2p\'s_world/2pJungleButton".is_hovered()):
		$"1p\'s_select".position.y = 405 
	if ($"2p\'s_world/2pLavaButton".is_hovered()):
		$"1p\'s_select".position.y = 520
		
	if ($"1p\'s_world/1pIceButton".is_hovered()):
		$"2p\'s_select".position.y = 290
	if ($"1p\'s_world/1pJungleButton".is_hovered()):
		$"2p\'s_select".position.y = 405 
	if ($"1p\'s_world/1pLavaButton".is_hovered()):
		$"2p\'s_select".position.y = 520


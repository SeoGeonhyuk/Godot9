extends Label


#var time = 120
#var timer_on = true


func _process(delta):
#	if(timer_on):
#		time -= delta
#	var mils = fmod(time, 1)*100
#	var secs = fmod(time,60)
#	var mins = fmod(time,60*60) / 60

#	if time <= 0.01:
#		timer_on = false
#		mils = 0
		
#	var time_passed = "%0.2d : %0.2d : %0.3d" %[mins,secs,mils]
	text = "Player 1 "#/ Shield = %d" %Player.shiled
	
#	pass

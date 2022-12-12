extends KinematicBody2D

onready var animation = $AnimatedSprite
var velocity = Vector2().normalized()
#signal bounce
var bounceBool = false
signal bounce

#var - speed
export (int) var run_speed = 2
export (int) var walk_speed = 2
var run_bool = false


#var - jump
export var fall_gravity_scale := 150.0
export var low_jump_gravity_scale := 100.0
export var jump_power := 400.0
export (int) var ini_jump = 0
var jump_released = false
var earth_gravity = 9.807
export var gravity_scale := 100.0
var on_floor = false


#var - gravity & inertia
export (int) var Air_Resistance = 0.1
const gravity = 8
const Max_speed = 300

#var - Benefit
var shield = 0
var Jump_ben = false
var Run_ben = false

func _ready():
	Checkpoint.last_position = get_parent().get_node("Player").global_position


func get_input(delta) :
	var right = Input.is_action_pressed('Player1_right')
	var left = Input.is_action_pressed('Player1_left')

	if left:
		velocity.x -= walk_speed * run_speed 
		#velocity.x = max(velocity.x-jump_speed,-Max_jump)
		animation.flip_h = false
		animation.play("RunRight")
	elif right:
		velocity.x += walk_speed * run_speed
		#velocity.x = min(velocity.x+run_speed,Max_speed)
		animation.flip_h = true
		animation.play("RunRight")
	else:
		animation.stop()
		velocity.x = lerp(velocity.x,0,Air_Resistance)
		
		
	if Input.is_action_just_released("Player1_Jump"):
		jump_released = true
		velocity += Vector2.DOWN * gravity * delta
	if velocity.y > 0:
		velocity += Vector2.DOWN * earth_gravity * fall_gravity_scale * delta
	elif velocity.y < 0 && jump_released:
		velocity += Vector2.DOWN * earth_gravity * low_jump_gravity_scale * delta
	if on_floor:
		if Input.is_action_just_pressed("Player1_Jump"):
			SoundManager.Jump_sound.play()
			ini_jump = jump_power 
			velocity += Vector2.UP * jump_power* run_speed / 2
			jump_released = false
	
	if is_on_floor(): on_floor = true
	else: on_floor = false
	
	
	
	if Input.is_action_pressed("Player1_Run"):
		run_speed = 2.2
	else :
		run_speed = 2

	

func _physics_process(delta):
	
	get_input(delta)
		
	velocity.y = velocity.y + gravity	
	
	
	velocity = move_and_slide(velocity,Vector2(0,-1))

#ball bounce
	var collision = move_and_collide(velocity * delta *0.1 )
	if collision:
		if collision.collider.name == "balls":
			print("d")
			collision = move_and_collide(velocity * delta)
			velocity = velocity.bounce(collision.normal)
			
			


func _on_crowns_body_entered(body):
	SignalBus.Player1Score += 1


func _on_fall_Player1_die():
	get_parent().get_node("Player").global_position = Checkpoint.last_position


func _on_traps_Player1_die_trap():
	if shield == 0:
		print(9999)
		get_parent().get_node("Player").global_position = Checkpoint.last_position
	else : shield -= 1



func _on_balls_body_entered(body):
	bounceBool = false
	emit_signal("bounce")
	print(body)
	bounceBool = true

func _on_balls_body_exited(body):
	bounceBool = false

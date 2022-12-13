extends KinematicBody2D

class_name Enemy

signal Player1_die_enemy
signal Player2_die_enemy

export (float) var gravity = 1000
export (int) var walk_speed = 20

var velocity : Vector2
var direction : String = "right"
var state

var rng = RandomNumberGenerator.new()
var input_direction_x

enum states{
	WALK,
	DEATH
}

func _ready()->void:
	rng.randomize()
	input_direction_x = 1
	state = states.WALK
	
	$MoveTimer.start()

func get_random_direction()->int:
	var random_number = rng.randi_range(0,1)
	return [-1,1][random_number]
	
func set_direction_right()->void:
	direction = "right"
	$AnimatedSprite.flip_h = true
func set_direction_left()->void:
	direction = "left"
	$AnimatedSprite.flip_h = false	
func update_direction(direction_x)->void:
	if direction_x > 0:
		set_direction_right()
	elif direction_x<0:
		set_direction_left()
func _physics_process(delta:float)->void:
	match state:
		states.WALK:
			$AnimatedSprite.play("Walk")
			update_direction(input_direction_x)
			velocity.x = walk_speed * input_direction_x
			apply_gravity(delta)
			velocity = move_and_slide(velocity, Vector2.UP)
		
		states.DEATH:
			$AnimatedSprite.play("Death")
			$CollisionShape2D.disabled = true
			yield($AnimatedSprite,"animation_finished")
			queue_free()
func apply_gravity(delta)-> void:
	velocity.y += gravity * delta
	
func _on_MoveTimer_timeout()->void:
	input_direction_x = get_random_direction()

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		emit_signal("Player1_die_enemy")
		print(1)
	elif body.name == "Player2":
		emit_signal("Player2_die_enemy")
		print(2)

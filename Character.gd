extends KinematicBody2D

var velocity = Vector2() #setget velset
var player_position = position
var Direction = "Right"
var direction = Vector2(DIRECTION_RIGHT, 1)
var gravityscale = Vector2(0,1000.0)
var jumpvelocity = -500.0
var move_right = false
var move_left = false
var jump = false
var esc_check = 0

signal shader
signal popup

const walkspeed = 400
const DIRECTION_RIGHT = 1
const DIRECTION_LEFT = -1


func get_input():
	if Input.is_action_pressed("Left"):
		velocity.x = -walkspeed
		set_direction(DIRECTION_LEFT)
		move_left = true
	elif Input.is_action_pressed("Right"):
		velocity.x = walkspeed
		set_direction(DIRECTION_RIGHT)
		move_right = true
	else:
		velocity.x = 0
	if not Input.is_action_pressed("Left"):
		move_left = false
	if not Input.is_action_pressed("Right"):
		move_right = false
	if Input.is_action_pressed("Up") and is_on_floor():
		velocity.y = jumpvelocity
		gravityscale.y = 1000
		jump = true
		
	if Input.is_action_pressed("ESC") and esc_check == 0:
		emit_signal("shader")
		esc_check = 1
		emit_signal("popup")
		get_tree().paused = true
	elif Input.is_action_pressed("ESC") and esc_check == 1:
		get_tree().paused = false
		esc_check = 0

func _physics_process(delta):
	get_input()
	
	var floor_normal = get_floor_normal().angle() + PI/2
	floor_normal = -round(rad2deg(floor_normal))
	#print(floor_normal)
	
	velocity.y += gravityscale.y * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor():
		gravityscale.y = 11000 
	else:
		gravityscale.y = 1000
	

func set_direction(hor_direction):
	if hor_direction == 0:
		hor_direction = DIRECTION_RIGHT
	var hor_dir_mod = hor_direction / abs(hor_direction)
	apply_scale(Vector2(hor_dir_mod * direction.x, 1))
	direction = Vector2(hor_dir_mod, direction.y)


#func velset(new_var):
	#velocity = 0



#set_color(Color(0.8,0.8,0.8))

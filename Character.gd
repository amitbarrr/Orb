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
var WallJump = false
onready var WallJumpTimer = get_node("WallJumpTimer")

signal shader
signal popup
signal WallJumpSignal

const walkspeed = 400
const DIRECTION_RIGHT = 1
const DIRECTION_LEFT = -1
const WallJumpVelocity = Vector2(350, -350)

func get_input():
	if WallJump == false:
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
	if is_on_wall():
		emit_signal("WallJumpSignal")
		
	if is_on_floor():
		WallJump = false
		

func set_direction(hor_direction):
	if hor_direction == 0:
		hor_direction = DIRECTION_RIGHT
	var hor_dir_mod = hor_direction / abs(hor_direction)
	apply_scale(Vector2(hor_dir_mod * direction.x, 1))
	direction = Vector2(hor_dir_mod, direction.y)

func get_which_wall_collided():
	for i in range(get_slide_count()):
		var collision = get_slide_collision(i)
		if collision.normal.x > 0:
			return "left"
		elif collision.normal.x < 0:
			return "right"
	return "none"

func _on_Character_WallJumpSignal():
	var WallDirection = get_which_wall_collided()
	if Input.is_action_just_pressed("Up"):
		WallJump = true
		
		#Jumped = true
		WallJumpTimer.start()
			
		if WallDirection == "left":
			velocity = WallJumpVelocity
			set_direction(DIRECTION_RIGHT)
				
		if WallDirection == "right":
			velocity.y = WallJumpVelocity.y
			velocity.x = -WallJumpVelocity.x
			set_direction(DIRECTION_LEFT)
				
				
func _on_WallJumpTimer_timeout():
	WallJump = false
	

#func velset(new_var):
	#velocity = 0





extends KinematicBody2D

var speed = 400
var velocity = Vector2()

func _physics_process(_delta):
	var start_pos = position
	var target_pos = get_viewport().get_mouse_position()

	self.global_position = start_pos
	#self.look_at(target_pos)
	var direction = (target_pos - start_pos).normalized()
	velocity = direction * speed 
	velocity = move_and_slide(velocity)
	var distance = target_pos.distance_to(position)
	if distance < 3:
		speed = 0
	if distance > 3:
		speed = 400

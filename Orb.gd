extends AnimatedSprite

var mouseposition

func _process(delta):
	mouseposition = get_local_mouse_position()
	move_and_slide(mouseposition)

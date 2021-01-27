extends Container


export var button_radius = 100 
export var radial_width = 50 

func _ready():
	place_buttons()

func place_buttons():
	var buttons = get_children()

	if buttons.size() == 0:
		return

	var angle_offset = (2*PI)/buttons.size() 

	var angle = 0 
	for btn in buttons: 
		var x = cos(angle)*button_radius
		var y = sin(angle)*button_radius

		
		var corner_pos = Vector2(x, -y)-(btn.get_size()/2) 
		btn.set_position(corner_pos)

		angle += angle_offset

func add_button(btn):
	add_child(btn)
	place_buttons()


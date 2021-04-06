extends CanvasModulate

func _ready():
	$Character.connect("shader", self, "brightness")

func _on_Character_shader():
	set_modulate(Color(0.3,0.3,0.3))



func _on_ESCMenu_hideshader():
	set_modulate(Color(1,1,1))




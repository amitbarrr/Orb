extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button1A_mouse_entered():
	self.disabled = false


func _on_Button1A_mouse_exited():
	self.disabled = true


func _on_Button1_pressed():
	print("The button is working")

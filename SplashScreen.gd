extends AnimationPlayer



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("Skip"):
		self.stop(true)
		get_tree().change_scene("res://MainMenu.tscn")



func _on_AnimationPlayer_animation_finished(SplashAnimation):
	get_tree().change_scene("res://MainMenu.tscn")

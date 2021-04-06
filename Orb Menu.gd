extends Container

signal StopOrb
signal StartOrb

func _ready():
	self.visible = false
func _physics_process(delta):
	if Input.is_action_pressed("Tab"):
		self.visible = true
		emit_signal("StopOrb")
	if Input.is_action_just_released("Tab"):
		self.visible = false
		emit_signal("StartOrb")



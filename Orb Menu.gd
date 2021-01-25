extends PopupMenu


export var radius = 120
export var speed = 0.5

var num
var active = false

func _ready():
	$Buttons.hide()
	num = $Buttons.get_child_count()
	for b in $Buttons.get_children():
		b.rect_position = rect_position
	connect("pressed", self, "_on_StartButton_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

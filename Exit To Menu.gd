extends Button


func _ready():
	pass # Replace with function body.


func _on_Exit_To_Menu_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
	get_tree().paused = false

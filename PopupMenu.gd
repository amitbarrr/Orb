extends PopupMenu

signal hideshader

func _on_Character_popup():
	self.popup()
	get_tree().paused = true

func _on_Resume_pressed():
	self.hide()
	emit_signal("hideshader")
	

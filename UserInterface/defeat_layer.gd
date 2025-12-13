extends CanvasLayer


func defeat() -> void:
	visible = true
	Engine.time_scale = 0

func _on_retry_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_quit_button_pressed() -> void:
	get_tree().quit()

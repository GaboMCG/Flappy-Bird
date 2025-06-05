extends Sprite2D

func _input(event):
	print("evento recibido:",event)
	if Input.is_action_just_pressed("volar") and get_tree().paused :
		get_tree().paused = false
		get_tree().reload_current_scene()
		$".".hide()
	else:
		$".".hide()
		$Gameover.hide()

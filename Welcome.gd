extends Control

func _on_Button_pressed():
	queue_free()
	get_parent().find_node("Game").show()
	



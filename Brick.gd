extends Area2D
class_name Brick


func _on_Brick_body_entered(body):
	if body is Ball:
		queue_free()
		get_parent().get_parent().set_Points(100)

extends KinematicBody2D

var speed = 600


func _physics_process(delta):
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
		
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		
	move_and_slide(Vector2(direction.x,0) * speed)
	position.y = 580

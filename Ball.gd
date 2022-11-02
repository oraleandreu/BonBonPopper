extends KinematicBody2D
class_name Ball

var speed = 0
var direction = Vector2.ZERO
var is_moving = false
onready var timer = get_parent().find_node("RestartTimer")

func _ready():
	randomize()

	
func reset_ball():
	timer.stop()
	speed = 400
	direction.x = [-0.5,0.5][randi() % 2]
	direction.y = -1
	is_moving = true
	
func _physics_process(delta):
	if is_moving:
		var collide = move_and_collide(direction * speed * delta)
		
		if collide:
			direction = direction.bounce(collide.normal)
			$Bouncesound.play()

func _on_RestartTimer_timeout():
	reset_ball()

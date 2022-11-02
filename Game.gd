extends Node2D

var brickscene = load("res://Brick.tscn")
var bricks = []
var bricksnumber = 89
var brightlimit = 840
var column = 0
var row = 0

func _process(delta):
	$Livesvar.text = str(get_parent().get_PlayerLives())
	$Pointsvar.text = str(get_parent().get_Points())
	if get_parent().get_PlayerLives() < 1:
		gameOver()

func _restart_game():
	$Ball.is_moving = false
	$Ball.direction = Vector2.ZERO
	$Ball.position = Vector2(512,500)
	#$Ball.reset_ball()
	$RestartTimer.start()
	$Player.position.x = 512
	$Player.position.y = 580

func _ready():
	_restart_game()
	brickInstancing()

func _on_Deadzone_body_entered(body):
	if body is Ball:
		get_parent().set_PlayerLives(-1)
		_restart_game()
		
func brickInstancing():
	for number in bricksnumber:
		var brick = brickscene.instance()
		add_child(brick)
		brick.position.x = 180 + (column * 50)
		brick.position.y = 25 + (row * 50)
		column += 1
		if brick.position.x > brightlimit:
			row += 1
			column = 0
			brick.position.x = 180 + (column * 50)
			brick.position.y = 25 + (row * 50)

func gameOver():
	queue_free()
	get_parent().find_node("GameOverScreen").show()

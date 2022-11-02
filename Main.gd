extends Node2D

var Points = 0
var PlayerLives = 5
var gamescene = load("res://Game.tscn") 

func get_PlayerLives():
	return PlayerLives
	
func set_PlayerLives(value):
	PlayerLives += value
	return PlayerLives

func get_Points():
	return Points
	
func set_Points(value):
	Points += value
	return Points

func _ready():
	$Welcome.hide()
	$GameOverScreen.hide()

func gamestart():
	var game = gamescene.instance()

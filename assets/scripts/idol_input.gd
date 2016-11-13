
extends Node2D
export var player=1

onready var parent= get_parent()


func _ready():
	set_process_input(true)
	


func _input(event):
	if(player==1):
		if event.is_action_pressed("player1_leap_left"):
			parent.action_leap(-1)
		if event.is_action_pressed("player1_leap_right"):
			parent.action_leap(1)
		if event.is_action_pressed("player1_climb"):
			parent.action_climb()
		if event.is_action_pressed("player1_dive"):
			parent.action_dive()
	if(player==2):
		if event.is_action_pressed("player2_leap_left"):
			parent.action_leap(-1)
		if event.is_action_pressed("player2_leap_right"):
			parent.action_leap(1)
		if event.is_action_pressed("player2_climb"):
			parent.action_climb()
		if event.is_action_pressed("player2_dive"):
			parent.action_dive()



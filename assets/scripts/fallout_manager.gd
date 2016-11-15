
extends Area2D
onready var width= get_tree().get_current_scene().get_viewport_rect().size.x
onready var height= get_tree().get_current_scene().get_viewport_rect().size.y
onready var middle= width/2

func _ready():
	#sets and scales the catcher to cover the screen.
	self.set_pos(Vector2(0,0))

	self.set_scale(Vector2(width,1))
	self.set_pos(Vector2(middle,height+50))
	

func _on_fallout_manager_body_enter( body ):
	if (body.is_in_group("idols")):
		var player_num=get_player_number(body)
		print("Player " + str(player_num)+ " fell out")
		respawn_player(player_num, get_player_type(body))
		body.queue_free()

func get_player_number(player):
	var brain=player.get_node("eidolin_input")
	return brain.player
	
func get_player_type(player):
	return player.idol_type
	
func respawn_player(number, type):
	#loads the requisite scene
	var filepath= ("res://assets/scenes/idol_parts/idol_" + type +"_player.tscn")
	var spawn_temp=load(filepath)
	var spawn=spawn_temp.instance()
	#sets position, type and player number
	spawn.set_pos(Vector2(middle, height/2))
	spawn.idol_type=type
	spawn.get_node("eidolin_input").player=number
	get_node("/root/world").add_child(spawn)
	
	
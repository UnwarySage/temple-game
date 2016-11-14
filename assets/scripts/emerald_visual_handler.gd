
extends AnimatedSprite
onready var dive_flare=get_node("eidolin_dive_flare")
var fx= preload("res://assets/scenes/fx_oneshots/emerald_flare.xml")


func end_dive():
	dive_flare.set_emitting(false)
	
func start_dive():
	dive_flare.set_emitting(true)
	var new_fx= fx.instance()
	new_fx.set_pos(self.get_global_pos())
	get_node("/root/world").add_child(new_fx)
	
	
func die(killer):
	self.set_modulate(Color("8b7b5151"))
	dive_flare.set_emitting(false)



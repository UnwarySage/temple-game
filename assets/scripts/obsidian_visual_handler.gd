#Obsidian visual handler
extends AnimatedSprite

var fx= preload("res://assets/scenes/fx_oneshots/emerald_flare.xml")
onready var smoker=get_node("eidolin_smoker")
onready var sparker=get_node("eidolin_sparks")
onready var anim= get_node("obsidian_animation")


func end_dive():
	smoker.set_emitting(false)
	sparker.set_emitting(false)
	anim.play("idle")
	
func climb():
	sparker.set_emitting(true)
	sparker.set_emit_timeout(0.25)
	
	
func start_dive():
	print(smoker)
	smoker.set_emitting(true)
	sparker.set_emitting(true)
	sparker.set_emit_timeout(0)
	anim.play("flare")
	
	"""
	var new_fx= fx.instance()
	new_fx.set_pos(self.get_global_pos())
	get_node("/root/world").add_child(new_fx)
	"""
	
	
func die(killer):
	anim.play("dead",-1,0,false)
	
	smoker.set_emitting(true)
	smoker.set_emit_timeout(2)
	smoker.set_amount(smoker.get_amount() -200)
	self.set_modulate(Color("8b7b5151"))




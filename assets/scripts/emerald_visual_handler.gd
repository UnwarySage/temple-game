
extends AnimatedSprite
onready var dive_flare=get_node("eidolin_dive_flare")


func end_dive():
	dive_flare.set_emitting(false)
	
func start_dive():
	dive_flare.set_emitting(true)



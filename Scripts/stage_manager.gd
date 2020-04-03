extends CanvasLayer
func _ready():
	change_stage()
	pass # Replace with function body.

func change_stage():
	get_node("anim").play("fade_in")
	yield(get_node("anim"), "animation_finished")
	get_tree().change_scene("res://Stages/Bg.tscn")

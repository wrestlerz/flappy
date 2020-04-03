extends Container
onready var hud = get_tree().get_root().get_child(0).get_node("bird")

func _ready():
	hud.connect("gameover",self,"gameov")
	pass # Replace with function body.

func gameov():
	visible = true
	pass

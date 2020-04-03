extends StaticBody2D

onready var sag_kenar = get_node("sag_kenar")
onready var camera = get_tree().get_root().get_child(0).get_node("cam")
onready var birds = get_tree().get_root().get_child(0).get_node("bird")

signal exit_tree

func _ready():
	if birds:
		birds.connect("collsig",self,"dcol")
	pass # Replace with function body.

func dcol():
	get_node("alt_col").disabled = true
	get_node("ust_col").disabled = true
func _process(_delta):
	if camera == null:
		return
		
	if sag_kenar.global_position.x <= camera.new_konum().x:
		queue_free()
		emit_signal("exit_tree")
	


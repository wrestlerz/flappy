extends StaticBody2D

onready var camera = get_tree().get_root().get_child(0).get_node("cam")
onready var sag_alt = get_node("sag_Alt")
signal destroyed

func _ready():
	set_process(true)
	pass # Replace with function body.


func _process(_delta):
	if camera == null:
		return
	
	
	if sag_alt.global_position.x <= camera.new_konum().x:
		queue_free()
		emit_signal("destroyed")
	

extends Camera2D


func _ready():
	pass

func _physics_process(_delta):
	position = Vector2(get_node("../bird").position.x, position.y)
	
	
	
func new_konum():
	return position + offset

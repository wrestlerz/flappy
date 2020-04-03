extends Label
onready var score = get_tree().get_root().get_child(0).get_node("boru_spawn")
var sayi = 0
var best_sayi = 0

func _ready():
	score.connect("scores",self,"scoreart")
	pass # Replace with function body.
	
func scoreart():
	sayi +=1
	best_sayi = sayi
	set_text(str(sayi))

extends Node2D

const sahne_zemin = preload("res://Scenes/zemin.tscn")
const ZEMIN_EN = 168
const eklenecek_zemin = 2


func _ready():
# warning-ignore:unused_variable
	for i in range(eklenecek_zemin):
		spawn_and_move()
		

func spawn_and_move():
	zemin_uret()
	sonraki_konum()

func zemin_uret():
	var yeni_zemin = sahne_zemin.instance()
	yeni_zemin.position = position
	yeni_zemin.connect("destroyed",self,"spawn_and_move")
	get_node("container").add_child(yeni_zemin)
	

func sonraki_konum():
	position = position + Vector2(ZEMIN_EN,0)
	pass

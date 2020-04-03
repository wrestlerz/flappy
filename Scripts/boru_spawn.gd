extends Node2D

const sahne_boru = preload("res://Scenes/boru.tscn")
const yer_yuksek = 56
const boru_gen = 26
const bosluk_x = 65
const bosluk_y = 55
const ekle_boru = 3
signal scores
var collsignal = false


func _ready():
	var bird = get_node("../bird")
	if bird:
		bird.connect("statech",self,"startb")
	pass # Replace with function body.


func startb():
	giris_konumuna_git()
	for i in range(ekle_boru):
		ekle_ve_ilerle()

func boru_uret():
	var yeni_boru = sahne_boru.instance()
	yeni_boru.position = position
	yeni_boru.connect("exit_tree",self,"ekle_ve_ilerle")
	yeni_boru.get_node("coin").connect("score",self,"scoret")
	get_node("container").add_child(yeni_boru)
	

func scoret():
	emit_signal("scores")


func ekle_ve_ilerle():
	boru_uret()
	sonraki_konuma_git()

func giris_konumuna_git():
	randomize()
	var giris_konumu = Vector2()
	giris_konumu.x = get_viewport_rect().size.x + boru_gen/2
	giris_konumu.y = rand_range(bosluk_y, get_viewport_rect().size.y - yer_yuksek - bosluk_y )
	
	var camera = get_node("../cam")
	if camera:
		giris_konumu.x += camera.position.x
	
	position = giris_konumu
	

func sonraki_konuma_git():
	randomize()
	var sonraki_konum = position
	sonraki_konum.x += boru_gen + bosluk_x 
	sonraki_konum.y = rand_range(bosluk_y, get_viewport_rect().size.y - yer_yuksek - bosluk_y )
	position = sonraki_konum
	
	
	

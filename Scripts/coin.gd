extends Area2D
signal score


func _ready():
	pass # Replace with function body.


func _on_coin_body_entered(_body):
	emit_signal("score")
	pass # Replace with function body.


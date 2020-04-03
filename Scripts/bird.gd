extends RigidBody2D
var startbl = false
var sayi = 0
var sayi_2 = 0
var control = false
signal gameover
signal statech
signal collsig
# Called when the node enters the scene tree for the first time.
func _ready():	
	pass



# warning-ignore:unused_argument
func _physics_process(delta):
	if control == true:
		dead()
	else:
		if startbl == false:
			if Input.is_action_just_pressed("flap"):
				startbl = true
				emit_signal("statech")
				get_node("../Click/clickimg").visible = false
		if startbl == false:
			get_node("anim").play("flying")
			linear_velocity = Vector2(50,linear_velocity.y)
			gravity_scale = 0
		else:
			gravity_scale = 2
			linear_velocity = Vector2(50,linear_velocity.y)
			if rotation_degrees < -30:
				rotation_degrees = -30
				angular_velocity = 0.5
		
			
			
			
			if	linear_velocity.y > 0:
				get_node("anim").play("dsme")
				angular_velocity = 2.5
				gravity_scale = 2
				if rotation_degrees >50:
					angular_velocity = 0
			
			if Input.is_action_just_pressed("flap"):
				get_node("anim").play("flap")
				linear_velocity = Vector2(0,-90)
				angular_velocity = -6
			
			if get_colliding_bodies():
				control = true
			
		

func dead():
	linear_velocity = Vector2(0,100)
	emit_signal("gameover")
	gravity_scale = 50
	angular_velocity = 0
	rotation_degrees = 45
	emit_signal("collsig")
			



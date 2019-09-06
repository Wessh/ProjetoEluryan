extends "res://Data/entity.gd"

const VEL = 70
var attack = false

func _physics_process(delta):
	control_loop()
	movement_loop()
	spritedir_loop()
	_setSpeed(VEL)
	
	
	if movedir != Vector2(0,0):
		anim_switch("walk")
	elif attack:
		movedir = Vector2(0,0)
		anim_switch("attack")
		yield($anim,"animation_finished")
		attack = false
	else:
		anim_switch("idle")

#Controle de entrada
func control_loop():
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	var LEFT	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var ATTACK	= Input.is_action_just_pressed("ui_select")
	
	movedir.x 	= -int(LEFT) + int(RIGHT)
	movedir.y 	= -int(UP) + int(DOWN)
	
	#Controle do attack
	if ATTACK and movedir == Vector2(0,0):
		attack = true
	
	
	
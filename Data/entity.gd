extends KinematicBody2D

var SPEED = 0		#Velocidade default
var TYPE = "ENEMY"	#Tipo de entidade default

var movedir = Vector2(0,0)		#Direção default 
var spritedir = "down"			#Direção default do sprite

#Controle dos loops de movimento
func movement_loop():
	var motion = movedir.normalized()*SPEED
	move_and_slide(motion,Vector2(0,0))
	
#Controle das direções do sprite
func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"
			
#Controle para trocar as animações
func anim_switch(animation):
	var newanim = str(animation,spritedir)
	if $anim.current_animation != newanim:
		$anim.play(newanim)

func _setSpeed(speed):
	SPEED = speed
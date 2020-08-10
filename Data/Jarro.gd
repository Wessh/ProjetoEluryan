extends StaticBody2D

var life = 1

func _dano(dano):
	
	if life == 1:
		life -= dano
		$anim.play("damaged")
		$Label.set_text("Ai!! você vai me quebrar!!")
	elif life <= 0:
		$Label.free()
		$CollisionShape2D.queue_free()
		$anim.play("crash")
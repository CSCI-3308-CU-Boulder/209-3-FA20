extends KinematicBody2D

var velocity = Vector2(0,0)
var currNum = 0
	
func _on_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
	pass 
	
func _process(delta):
	currNum = currNum + 0.025
	set_position(get_position() + Vector2((sin(currNum))/2,0))	
	pass

extends KinematicBody2D

var velocity = Vector2(0,0)
	
func _on_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
	pass 

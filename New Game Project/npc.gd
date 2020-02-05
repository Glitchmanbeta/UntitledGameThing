extends Area2D


func _ready():
	pass # Replace with function body.



func _on_Area2D_body_entered(body):
	if Input.is_action_just_pressed("interactions"):
		

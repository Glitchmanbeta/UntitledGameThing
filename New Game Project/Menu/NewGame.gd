extends TextureButton



func _ready():
	pass # Replace with function body.



# Using the code from Global.gd, when the newGame button is pressed
# it will go to the new scene, mock.tscn
func _on_NewGame_pressed():
	Global.goto_scene("res://mock.tscn")

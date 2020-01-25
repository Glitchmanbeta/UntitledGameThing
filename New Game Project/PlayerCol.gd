extends KinematicBody2D

var speed = 250
var velocity = Vector2()
var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func get_input():
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
		velocity.x += 1
	elif Input.is_action_pressed('ui_left'):
		velocity.x -= 1
	elif Input.is_action_pressed('ui_down'):
		velocity.y += 1
	elif Input.is_action_pressed('ui_up'):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "left";
		$AnimatedSprite.flip_v = false;
		$AnimatedSprite.flip_h = velocity.x > 0
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up";
	elif velocity.y > 0:
		$AnimatedSprite.animation = "down";
		
	
func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 100; # The export keyword allows this const to be changed in the node inspector.
var screen_size;

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size;
	
func _process(delta):
	var velocity = Vector2();
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1;
	elif Input.is_action_pressed("ui_left"):
		velocity.x -= 1;
	elif Input.is_action_pressed("ui_down"):
		velocity.y += 1;
	elif Input.is_action_pressed("ui_up"):
		velocity.y -= 1;
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed;
		$AnimatedSprite.play(); # $ is shorthand for get_node()
	else:
		$AnimatedSprite.stop();
	
	position += velocity * delta;
	position.x = clamp(position.x, 0, screen_size.x);
	position.y = clamp(position.y, 0, screen_size.y); # Clamp restricts the sprite to the game window
	
	if velocity.x != 0:
		$AnimatedSprite.animation = "left";
		$AnimatedSprite.flip_v = false;
		$AnimatedSprite.flip_h = velocity.x > 0
	elif velocity.y < 0:
		$AnimatedSprite.animation = "up";
	elif velocity.y > 0:
		$AnimatedSprite.animation = "down";
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

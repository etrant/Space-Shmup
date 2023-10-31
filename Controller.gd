extends CharacterBody2D

@export var speed = 500;
@export var fire_rate = 10;

var screen_size;

func _ready():
	screen_size = get_viewport_rect().size;


func _physics_process(delta):
	get_input();


func get_input():
	if (Input.is_action_pressed('shoot')):
		shoot();
		
	velocity = Vector2.ZERO
	if (Input.is_action_pressed('move_up')):
		velocity.y -= speed;
	if (Input.is_action_pressed('move_down')):
		velocity.y += speed;
	if (Input.is_action_pressed('move_left')):
		velocity.x -= speed;
	if (Input.is_action_pressed('move_right')):
		velocity.x += speed;
	
	position += velocity
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, screen_size.y / 2, screen_size.y)
	
		

func shoot():
	print('Shooting');
		


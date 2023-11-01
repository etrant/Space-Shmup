extends CharacterBody2D

@export var speed = 500;
@export var reload_time = 0
var projectile = load("res://projectiles/bullet.tscn")

var screen_size;

func _ready():
	screen_size = get_viewport_rect().size;


func _physics_process(delta):
	reload_time -= delta
	
	get_input(delta);


func get_input(dt : float):
	
	if (Input.is_action_pressed('shoot') and reload_time <= 0):
		shoot();
		
	velocity = Vector2.ZERO
	if (Input.is_action_pressed('move_up')):
		velocity.y -= speed * dt;
	if (Input.is_action_pressed('move_down')):
		velocity.y += speed * dt;
	if (Input.is_action_pressed('move_left')):
		velocity.x -= speed * dt;
	if (Input.is_action_pressed('move_right')):
		velocity.x += speed * dt;
	
	position += velocity
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	
		

func shoot():
	
	var inst1 = projectile.instantiate()
	owner.add_child(inst1)
	inst1.transform = $BulletMarker1.global_transform
	
	var inst2 = projectile.instantiate()
	owner.add_child(inst2)
	inst2.transform = $BulletMarker2.global_transform
	
	var inst3 = projectile.instantiate()
	owner.add_child(inst3)
	inst3.transform = $BulletMarker3.global_transform
	
	reload_time = 0.1
		
		
func hit():
	Globals.gamestate = false
	print("Game Over")


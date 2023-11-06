extends CharacterBody2D

@onready var screen_size := get_viewport_rect().size
@onready var anim := $AnimationPlayer as AnimationPlayer
@export var speed : float = 100.0


func _physics_process(delta) -> void:
	get_input(delta);
	set_animation();


func get_input(delta : float):
	velocity = Vector2.ZERO;
	
	if (Input.is_action_pressed('move_up')):
		velocity.y -= speed * delta;
	if (Input.is_action_pressed('move_down')):
		velocity.y += speed * delta;
	if (Input.is_action_pressed('move_left')):
		velocity.x -= speed * delta;
	if (Input.is_action_pressed('move_right')):
		velocity.x += speed * delta;
	
	position += velocity
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func set_animation():
	var direction = (
		'bankLeft' if velocity.x < 0 
		else 'bankRight' if velocity.x > 0
		else 'idle'
	)
	
	anim.play(direction);


func shoot():
	pass


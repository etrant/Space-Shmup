extends CharacterBody2D

@onready var screen_size := get_viewport_rect().size as Vector2
@onready var anim := $AnimationPlayer as AnimationPlayer
@export var Bullet : PackedScene
@export var speed : float = 100.0
@export var fire_rate : float = 0.1
@export var health : int = 5
var invincible : bool = false
var reload_time : float = 0

func _physics_process(delta) -> void:
	get_input(delta)
	set_animation()
	reload_time -= delta

func get_input(delta : float) -> void:
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed('move_up'):
		velocity.y -= speed * delta
	if Input.is_action_pressed('move_down'):
		velocity.y += speed * delta
	if Input.is_action_pressed('move_left'):
		velocity.x -= speed * delta
	if Input.is_action_pressed('move_right'):
		velocity.x += speed * delta
	if Input.is_action_pressed("shoot") and reload_time <= 0:
		reload_time = fire_rate
		shoot()
	
	position += velocity.normalized() * speed * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


func set_animation() -> void:
	var direction = (
		'bankLeft' if velocity.x < 0 
		else 'bankRight' if velocity.x > 0
		else 'idle'
	)
	
	anim.play(direction);


func shoot() -> void:
	var b = Bullet.instantiate()
	owner.add_child(b) 
	b.transform = $Marker2D.global_transform
	b.rotation = -PI/2
	
	var c = Bullet.instantiate()
	owner.add_child(c) 
	c.transform = $Marker2D2.global_transform
	c.rotation = -PI/2
		

func hit() -> void:
	if invincible == false:
		health -= 1
		print(health)
		invincible = true
		$InvincibilityTimer.start()
		if health < 1:
			print("DEAD")


func _on_invincibility_timer_timeout():
	invincible = false

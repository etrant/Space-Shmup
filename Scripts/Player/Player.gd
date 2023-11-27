extends CharacterBody2D

@onready var screen_size := get_viewport_rect().size as Vector2
@onready var anim := $AnimationPlayer as AnimationPlayer
@onready var audioReady: bool = true
@onready var can_shoot: bool = true


@export var Bullet : PackedScene
@export var speed : float = 100.0
@export var fire_rate : float = 0.1
@export var health : int = 3
@export var time_invincible: float = .2


var invincible : bool = false
var reload_time : float = 0


func _ready():
	$Sprite2D.visible = true
	Global.lives = health


func _physics_process(delta) -> void:
	get_input(delta)
	set_animation()
	reload_time -= delta
	$InvincibilityTimer.wait_time = time_invincible


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
	if Input.is_action_pressed("shoot") and reload_time <= 0 and can_shoot:
		reload_time = fire_rate
		shoot()
	
	position += velocity.normalized() * speed * delta
	position.x = clamp(position.x, 10, screen_size.x - 10)
	position.y = clamp(position.y, 0, screen_size.y - 10)


func set_animation() -> void:
	if not invincible:
		var direction = (
			'bankLeft' if velocity.x < 0 
			else 'bankRight' if velocity.x > 0
			else 'idle'
		)
	
		anim.play(direction);


func shoot() -> void:
	$LaserGun.play()
	var b = Bullet.instantiate()
	owner.add_child(b) 
	b.transform = $Marker2D.global_transform
	b.rotation = -PI/2
	
	var c = Bullet.instantiate()
	owner.add_child(c) 
	c.transform = $Marker2D2.global_transform
	c.rotation = -PI/2
		

func hit() -> void:
	if invincible == false and health >= 1:
		can_shoot = false
		$Crash.play()
		health -= 1
		Global.lives -= 1
		print(health)
		invincible = true
		anim.play("I-Frames")
		$InvincibilityTimer.start()
		if health < 1:
			$Death.play()
			$Delay.start()
			await($Delay.timeout)
			get_tree().change_scene_to_file("res://Scenes/game_over.tscn")
			


func _on_invincibility_timer_timeout():
	invincible = false
	can_shoot = true
	anim.stop()
	$Sprite2D.visible = true
	anim.play("idle")



extends CharacterBody2D

@export var reload_time = 1
var projectile = load("res://projectiles/enemy_bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	reload_time -= delta
	if reload_time <= 0:
		shoot_toward_player()
	
func shoot_toward_player():
	var inst = projectile.instantiate()
	owner.add_child(inst)
	inst.transform = global_transform
	inst.direction = (Globals.player_position - global_position).normalized()
	reload_time = 1
	
func hit():
	Globals.score += 1000
	print(Globals.score)
	self.queue_free()
	

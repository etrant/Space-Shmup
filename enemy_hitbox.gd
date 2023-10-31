extends CharacterBody2D

@export var reload_time = 0.5
projectile = load(enemy_)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	reload_time -= delta
	if reload_time <= 0:
		shoot_toward_player()
	
func shoot_toward_player():
	
	
func hit():
	self.queue_free()

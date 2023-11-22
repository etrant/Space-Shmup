extends Enemy
class_name RadialEnemy


@export var Bullet : PackedScene

@export var spawnpoints : int = 20
@export var radius : float = 10
@export var cooldown : float = 0.5

var bullet_spawner : Node2D
var cooldownTimer : Timer


func _init():
	cooldownTimer = Timer.new()
	cooldownTimer.one_shot = true
	add_child(cooldownTimer)
	
	bullet_spawner = Node2D.new()
	add_child(bullet_spawner)
	
	var step = 2 * PI / spawnpoints
	
	for i in spawnpoints:
		var spawnpoint = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawnpoint.position = pos
		spawnpoint.rotation = pos.angle() # relevant for direction of bullets
		bullet_spawner.add_child(spawnpoint)
	

func _physics_process(_delta):
	if can_shoot and cooldownTimer.time_left == 0:
		shoot()


func shoot():
	for point in bullet_spawner.get_children():
		var inst = Bullet.instantiate()
		get_tree().current_scene.add_child(inst)
		inst.global_transform = point.global_transform
	
	cooldownTimer.start(cooldown)

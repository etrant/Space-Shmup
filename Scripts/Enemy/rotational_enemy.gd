extends Enemy

@export var Bullet : PackedScene
@export var spawnpoints: int = 4
@export var rotation_speed: float = 100
@export var radius: float = 100
@export var shoot_time: float = 1

func _ready():
	var step = 2 * PI / spawnpoints
	
	for i in spawnpoints:
		var spawn = Node2D.new()
		var pos = Vector2(radius, 0).rotated(step * i)
		spawn.global_position = pos
		spawn.global_rotation = pos.angle()
		$Rotater.add_child(spawn)
	
	$Timer.start()

func _physics_process(delta):
	$Timer.wait_time = shoot_time
	var temp_rotate = $Rotater.rotation_degrees + rotation_speed * delta
	$Rotater.rotation_degrees = fmod(temp_rotate, 360)

func shoot():
	if can_shoot:
		for s in $Rotater.get_children():
			var inst = Bullet.instantiate()
			get_tree().current_scene.add_child(inst)
			inst.global_position = s.global_position 
			inst.global_rotation = s.global_rotation

func _on_timer_timeout():
	shoot()




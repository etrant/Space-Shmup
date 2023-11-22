extends Node2D
class_name Formation


@onready var follower = preload("res://Scripts/Enemy/follower_basic_enemy.tscn")
@onready var number_of_enemies : int = 10
@export var required_enemies : int = 10 # 1 already in scene
var finished_spawning = false
var can_spawn = true


func _ready() -> void:
	print('Enemies in wave: ', number_of_enemies)
	
	
func _physics_process(delta) -> void:
	if required_enemies > 0 and can_spawn:
		spawn_enemy()
		
	if required_enemies == 0 and !finished_spawning:
		finished_spawning = true
		
	if $Path2D.get_child_count() == 0 and finished_spawning:
		await get_tree().create_timer(1.0).timeout
		queue_free()
	

func spawn_enemy():
	var f = follower.instantiate()
	$Path2D.add_child(f)
	required_enemies -= 1
	can_spawn = false
	$SpawnTimer.start()


func _on_spawn_timer_timeout():
	can_spawn = true

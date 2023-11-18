extends Node2D
class_name Formation

@onready var follower = preload("res://Scripts/Enemy/follower_basic_enemy.tscn")
@onready var number_of_enemies : int = 10
@export var required_enemies : int = 10 # 1 already in scene


func _ready() -> void:
	print('Enemies in wave: ', number_of_enemies)
	
	
func _physics_process(delta) -> void:
	if number_of_enemies == 0:
		await get_tree().create_timer(2.0).timeout
		queue_free()
	

extends Node2D
class_name Formation

@onready var number_of_enemies : int = get_child_count()

func _ready() -> void:
	print('Enemies in wave: ', number_of_enemies)
	
func _process(_delta) -> void:
	if number_of_enemies == 0:
		await get_tree().create_timer(2.0).timeout
		queue_free()


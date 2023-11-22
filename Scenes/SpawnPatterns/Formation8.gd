extends Formation

@onready var follower = preload("res://Scripts/Enemy/follower_basic_enemy.tscn")
@export var required_enemies : int = 10

func spawn_follower_enemy() -> void:
	var e = follower.instantiate()
	$Path2D.add_child(e)
	
func spawn_follower_offset_enemy() -> void:
	var e = follower.instantiate()
	$Path2D.add_child(e)
	e.h_offset = -20
	e.v_offset = -20

func _on_timer_timeout():
	if (required_enemies != 0):
		spawn_follower_enemy()
		spawn_follower_offset_enemy()
		required_enemies -= 2
	else:
		$SpawnTimer.queue_free()

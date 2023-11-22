extends Formation

func _ready():
	number_of_enemies = 1

func _physics_process(_delta):
	if get_child_count() == 0:
		await get_tree().create_timer(1.0).timeout
		queue_free()


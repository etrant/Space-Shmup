extends Enemy

@export var rotational_shooters : PackedScene


func _ready():
	spawn_shooter()

func spawn_shooter():
	var inst = rotational_shooters.instantiate()
	get_tree().current_scene.add_child(inst)
	

func _process(delta):
	pass

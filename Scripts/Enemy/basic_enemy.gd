extends Enemy

@export var Bullet : PackedScene
@onready var ray = $RayCast2D
@onready var reload_timer = $Timer
@onready var target

func _ready():
	await(get_tree().process_frame)
	target = find_target()
	reload_timer.start()

func _physics_process(_delta):
	if target != null:
		ray.global_rotation = global_position.direction_to(target.global_position).angle()
	
func shoot():
	var inst = Bullet.instantiate()
	get_tree().current_scene.add_child(inst)
	inst.global_position = global_position
	inst.global_rotation = ray.global_rotation
	
	reload_timer.start()
	
func find_target():
	var new_target: Node2D = null
	
	if get_tree().has_group("Player"):
		new_target = get_tree().get_nodes_in_group("Player")[0]
		
	return new_target



func _on_timer_timeout():
	shoot()

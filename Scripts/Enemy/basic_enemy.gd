extends Enemy
# what happens if a player touches a enemy (they should act like a bullet and die -- kamakazi)

@export var Bullet : PackedScene
@onready var ray = $RayCast2D
@onready var reload_timer = $Timer
@onready var target : CharacterBody2D
var path_follow

func _ready():
	$AnimatedSprite2D.play("default")
	if (get_parent() is PathFollow2D):
		path_follow = get_parent()
	await(get_tree().process_frame)
	target = find_target()
	reload_timer.start()


func _physics_process(delta):
	if path_follow != null:
		path_follow.progress += velocity * delta
	else:
		position += transform.y * velocity * delta
	if target != null:
		ray.global_rotation = global_position.direction_to(target.global_position).angle()
		$AnimatedSprite2D.look_at(target.global_position) #TODO: FIX this is off
		$AnimatedSprite2D.rotation -= 3*PI/2
	
func shoot():
	if can_shoot:
		var inst = Bullet.instantiate()
		get_tree().current_scene.add_child(inst)
		inst.global_position = global_position
		inst.global_rotation = ray.global_rotation
		
		reload_timer.start()
		
	
func find_target() -> CharacterBody2D:
	var new_target: Node2D = null
	
	if get_tree().has_group("Player"):
		new_target = get_tree().get_nodes_in_group("Player")[0]
		
	return new_target


func _on_timer_timeout():
	shoot()


func _on_area_entered(area):
	if area.name == "PlayerArea":
		get_tree().call_group("Player", "hit")
		die()

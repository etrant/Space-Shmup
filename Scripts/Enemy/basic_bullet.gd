extends Area2D

@export var speed : float = 300
@export var damage : float = 1
const RIGHT = Vector2.RIGHT


func _ready():
	$EnemyBlast.play()

func _physics_process(delta):
	position += RIGHT.rotated(rotation) * speed * delta
	

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _on_area_entered(area):
	if area.name == "PlayerArea":
		get_tree().call_group("Player", "hit")

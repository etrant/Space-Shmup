extends Area2D


@export var speed : float = 300
@export var damage : float = 1


func _ready():
	$BossBlast.play()

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_area_entered(area):
	if area.name == "PlayerArea":
		get_tree().call_group("Player", "hit")

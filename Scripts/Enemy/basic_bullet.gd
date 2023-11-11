extends Area2D

@export var speed : float = 300
@export var damage : float = 1
const RIGHT = Vector2.RIGHT


func _physics_process(delta):
	position += RIGHT.rotated(rotation) * speed * delta
		
	

func on_viewport_exited(_viewport):
	queue_free()

func _on_body_entered(body):
	if body.name == "Player":
		await(body.hit())
		queue_free()
		
	

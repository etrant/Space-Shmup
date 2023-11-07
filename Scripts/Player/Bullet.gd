extends Area2D

@onready var anim := $AnimationPlayer as AnimationPlayer
@export var speed : float = 500


func _ready():
	anim.play('fire')


func _physics_process(delta):
	position += transform.x * speed * delta
		
	

func _on_area_entered(area):
	var parent = area.get_parent()
	if parent.has_method('hit'):
		parent.hit()
		queue_free()


func on_viewport_exited(_viewport):
	queue_free()


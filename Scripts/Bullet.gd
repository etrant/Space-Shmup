extends Area2D

@onready var anim := $AnimationPlayer as AnimationPlayer
var speed = 750

func _ready():
	anim.play('fire')

func _physics_process(delta):
	position += transform.x * speed * delta


# white shader on hit

# delete if hits or leaves frame

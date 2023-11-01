extends Node2D

@export var bullet_speed = 150;
var direction


func _ready():
	pass

func _physics_process(delta):
	translate(direction*bullet_speed*delta)


func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()



func _on_bullet_box_body_entered(body):
	if body.has_method("hit") and body.name == "Player":
		body.hit()
		self.queue_free()



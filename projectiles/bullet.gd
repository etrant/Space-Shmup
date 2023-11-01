extends Node2D

@export var bullet_speed = 1000;


func _process(delta):
	position.y -= bullet_speed * delta;


func _on_visible_on_screen_notifier_2d_screen_exited():
	self.queue_free()



func _on_bullet_box_body_entered(body):
	if body.has_method("hit"):
		body.hit()
	self.queue_free()

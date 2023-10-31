extends Area2D

@export var bullet_speed = 1000;


func _process(delta):
	position.y -= bullet_speed * delta;
	#if (position.y > get_viewport_rect().size.y || position.y < 0):
		#self.queue_free();



#if hits something or flys out
# remove the instance, OR ELSE >:(

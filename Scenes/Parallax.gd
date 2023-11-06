extends ParallaxBackground

@export var scroll_speed : float = 50;

func _process(delta):
	scroll_offset.y += scroll_speed * delta;

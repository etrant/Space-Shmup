extends Node2D

@export var combat_position = Vector2(120,80) as Vector2
@export var animation_speed : float = 5


func _ready():
	$BossUI.visible = false
	var tween = create_tween()
	await tween.tween_property($Boss, "position", combat_position, animation_speed).set_trans(Tween.TRANS_ELASTIC)
	$BossUI.visible = true


func _physics_process(_delta):
	if (get_child_count() <= 0):
		print("You win")
		queue_free()



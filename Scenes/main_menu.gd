extends Node2D

var timerBool: bool = true

func _ready():
	$Timer.start()



func _process(_delta):
	if Input.is_action_just_pressed("continue"):
		get_tree().change_scene_to_file("res://Scenes/Main.tscn")


func _on_timer_timeout():
	if $Label.visible == true:
		$Label.visible = false
	else:
		$Label.visible = true
		


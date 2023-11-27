extends Node2D


var timerBool: bool = true
var contBool: bool = false


func _ready():
	$Timer.start()
	$MenuMusic.play()


func _process(_delta):
	if Input.is_action_just_pressed("continue") and contBool == false:
		contBool = true
		$Timer.wait_time = .1
		$GameStart.play()


func _on_timer_timeout():
	if $Label.visible == true:
		$Label.visible = false
	else:
		$Label.visible = true
		



func _on_game_start_finished():
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")



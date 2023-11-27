extends Node2D


func _ready():
	$Music.play()
	$Score.text = "Score: " + str(Global.score)


func _on_continue_button_pressed():
	Global.score = 0
	get_tree().change_scene_to_file("res://Scenes/Main.tscn")

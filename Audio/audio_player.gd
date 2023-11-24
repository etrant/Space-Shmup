extends Node2D

@export var audioplayer : PackedScene

func EnemyDies():
	var inst = audioplayer.instantiate()
	get_tree().current_scene.add_child(inst)
	inst.play()

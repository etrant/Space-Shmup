extends Node

var score = 0
var gamestate = true
var player_position


func _process(_delta):
	player_position = get_tree().get_nodes_in_group("Player")[0].global_position

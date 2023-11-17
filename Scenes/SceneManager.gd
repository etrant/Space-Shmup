extends Node2D

# popcorn enemies
@onready var single_enemy_center = preload("res://Scenes/SpawnPatterns/Formation1.tscn")
@onready var three_enemy_left = preload("res://Scenes/SpawnPatterns/Formation2.tscn")
@onready var three_enemy_right = preload("res://Scenes/SpawnPatterns/Formation3.tscn")

# large enemies
@onready var single_big_enemy_left = preload("res://Scenes/SpawnPatterns/Formation4.tscn")
@onready var single_big_enemy_right = preload("res://Scenes/SpawnPatterns/Formation5.tscn")

# path2d / fancy-pants enemies
@onready var many_swarm_enemy_to_right
@onready var many_swarm_enemy_to_left
@onready var many_zigzag_enemy


func singleEnemyCenter() -> void:
	var inst = single_enemy_center.instantiate()
	add_child(inst)


func threeEnemyLeft() -> void:
	var inst = three_enemy_left.instantiate()
	add_child(inst)


func threeEnemyRight() -> void:
	var inst = three_enemy_right.instantiate()
	add_child(inst) 

	
func bigEnemyLeft() -> void:
	var inst = single_big_enemy_left.instantiate()
	add_child(inst) 


func bigEnemyRight() -> void:
	var inst = single_big_enemy_right.instantiate()
	add_child(inst) 

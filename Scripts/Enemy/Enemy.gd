extends Area2D
class_name Enemy

@onready var hit_player := $HitFlashAnimationPlayer as AnimationPlayer
@export var health : float = 100
@export var velocity : float = 10
@export var can_shoot = false
@export var can_die = false
@export var value = 100
@export var hit_value = 0

const EnemyDeathEffect = preload("res://Effects/enemy_death_effect.tscn")


func hit(damage):
	if can_die and health > 0:
		var old_health = health
		health -= damage
		Global.score += hit_value
		print("Old: %s  New: %s"%[old_health, health])
		
		if health == 0:
			die()
			
		hit_player.play('hit_flash')
	
func die():
	Global.score += value
	queue_free()
	var enemy_death_effect = EnemyDeathEffect.instantiate()
	get_parent().add_child(enemy_death_effect)
	enemy_death_effect.global_position = global_position;



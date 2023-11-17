extends Area2D
class_name Enemy

@onready var hit_player := $HitFlashAnimationPlayer as AnimationPlayer
@export var health : float = 100
@export var velocity : float = 10

const EnemyDeathEffect = preload("res://Effects/enemy_death_effect.tscn")

func hit(damage):
	var old_health = health
	health -= damage
	
	print("Old: %s  New: %s"%[old_health, health])
	
	if health <= 0:
		die()
		
	hit_player.play('hit_flash')
	
func die():
	queue_free()
	var enemy_death_effect = EnemyDeathEffect.instantiate()
	get_parent().add_child(enemy_death_effect)
	enemy_death_effect.global_position = global_position;


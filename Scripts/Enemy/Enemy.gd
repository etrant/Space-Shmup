extends Node2D
class_name Enemy

@onready var hit_player := $HitFlashAnimationPlayer as AnimationPlayer
@export var health : float = 100


func hit(damage):
	var old_health = health
	health -= damage
	
	print("Old: %s  New: %s"%[old_health, health])
	
	if health <= 0:
		die()
		
	hit_player.play('hit_flash')
	
func die():
	pass

extends Node2D

@export var EnemyDeath : PackedScene
@export var Hit : PackedScene
@export var BossScream : PackedScene
@export var Explosion : PackedScene

func EnemyDies():
	var inst = EnemyDeath.instantiate()
	get_tree().current_scene.add_child(inst)
	inst.play()
	
func EnemyHit():
	var inst = Hit.instantiate()
	get_tree().current_scene.add_child(inst)
	inst.play()
	
func BossDies():
	var inst = BossScream.instantiate()
	get_tree().current_scene.add_child(inst)
	inst.play()
	
func explosion():
	var inst = Explosion.instantiate()
	get_tree().current_scene.add_child(inst)
	inst.play()

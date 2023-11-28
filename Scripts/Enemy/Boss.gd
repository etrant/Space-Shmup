extends RadialEnemy


@export var phase_cooldown : float = 10
@export var distance_to_travel : float = 90

@onready var rand = RandomNumberGenerator.new()


func _ready():
	$"../BossUI/BossBar".max_value = health
	$BossSprite.play('passive')
	
	# give time for the intialization animation to play
	await create_tween().tween_interval(4).finished
	
	can_die = true
	can_shoot = true
	$ActiveTimer.start()
	$BossSprite.play('active')
	
	var tween = create_tween().set_loops()
	
	tween.tween_property(self, "position:x", distance_to_travel, velocity).as_relative()
	tween.tween_property(self, "position:x", -distance_to_travel, velocity).as_relative()
	tween.tween_property(self, "position:x", -distance_to_travel, velocity).as_relative()
	tween.tween_property(self, "position:x", distance_to_travel, velocity).as_relative()

func _process(_delta):
	$"../BossUI/BossBar".value = health

func _on_area_entered(area):
	if area.name == "PlayerArea":
		get_tree().call_group("Player", "hit")


func _on_passive_timer_timeout():
	can_shoot = true
	$BossSprite.play('active')
	$ActiveTimer.start()
	pass

func _on_active_timer_timeout():
	can_shoot = false
	$BossSprite.play('passive')
	$PassiveTimer.start()
	pass
	
func die():
	Global.score += value
	can_shoot = false
	can_die = false
	AudioPlayer.BossDies()
	
	for i in 6:
		var effectPosition = Vector2((global_position.x + rand.randf_range(-20,20)), (global_position.y + rand.randf_range(-20,20)))
		var enemy_death_effect = EnemyDeathEffect.instantiate()
		get_parent().add_child(enemy_death_effect)
		enemy_death_effect.global_position = effectPosition;
		AudioPlayer.explosion()
		$DeathAnimTimer.start()
		await($DeathAnimTimer.timeout)
	
	$BossSprite.visible = false
	
	$DeathAnimTimer.wait_time = 1.75
	$DeathAnimTimer.start()
	await($DeathAnimTimer.timeout)
	
	queue_free()
	get_tree().change_scene_to_file("res://Scenes/win_screen.tscn")
	


extends RadialEnemy

@export var phase_cooldown : float = 10
@export var distance_to_travel : float = 90


func _ready():
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


func _on_area_entered(area):
	if area.name == "PlayerArea":
		get_tree().call_group("Player", "hit")


func _on_passive_timer_timeout():
	can_shoot = true
	$BossSprite.play('active')
	$ActiveTimer.start()


func _on_active_timer_timeout():
	can_shoot = false
	$BossSprite.play('passive')
	$PassiveTimer.start()


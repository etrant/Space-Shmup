extends RadialEnemy


func _ready():
	$BossSprite.play('passive')
	# give time for the intialization animation to play
	await create_tween().tween_interval(4).finished
	
	can_die = true
	# play active animation when shooting
	# stop and play passive after 10 seconds
	
	var tween = create_tween().set_loops()

	tween.tween_property($BossSprite, "position:x", 90, velocity)
	tween.tween_property($BossSprite, "position:x", 0, velocity)
	tween.tween_property($BossSprite, "position:x", -90, velocity)
	tween.tween_property($BossSprite, "position:x", 0, velocity)


func _on_area_entered(area):
	if area.name == "PlayerArea":
		get_tree().call_group("Player", "hit")

extends Enemy

@export var reload_time: float = .5

func _ready():
	$rotational_shooter.can_shoot = true
	can_die = true
	

func _process(_delta):
	$rotational_shooter.global_position = global_position
	$rotational_shooter.shoot_time = reload_time


func _on_area_entered(area):
	if area.name == "PlayerArea":
		get_tree().call_group("Player", "hit")

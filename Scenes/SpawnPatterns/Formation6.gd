extends Formation

@onready var follower = preload("res://Scripts/Enemy/follower_basic_enemy.tscn")
@export var required_enemies : int = 10

func _ready():
	number_of_enemies = 10

func _physics_process(_delta):

	if required_enemies > 0 and can_spawn:
		spawn_enemy()
	if required_enemies == 0 and !finished_spawning:
		finished_spawning = true

func spawn_enemy():
	var f = follower.instantiate()
	$Path2D.add_child(f)
	required_enemies -= 1
	can_spawn = false
	$SpawnTimer.start()


func _on_spawn_timer_timeout():
	can_spawn = true

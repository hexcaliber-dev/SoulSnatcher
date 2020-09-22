extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var spawn_interval = 3 # Time between enemy spawns, in seconds.
export var spawn_range = 5 # Distance away from player this enemy should spawn
var enemy = load("res://Assets/src/Enemy.tscn")
var rng = RandomNumberGenerator.new()
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.set_wait_time(spawn_interval)
	add_child(timer)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "spawn_enemy")
	timer.start()
	print(timer)

func spawn_enemy():
	# print("SPAWN")
	var new_enemy = enemy.instance()
	var player_pos = get_parent().get_node("Player").position
	rng.randomize()
	var spawn_pos = player_pos + Vector2(rng.randf_range(-spawn_range, spawn_range),
		rng.randf_range(-spawn_range, spawn_range))
	new_enemy.set_position(spawn_pos)
	get_parent().add_child(new_enemy)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	

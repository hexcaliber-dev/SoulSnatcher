extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var spawn_interval = 3 # Time between enemy spawns, in seconds.
# Called when the node enters the scene tree for the first time.
func _ready():
	var timer = Timer.new()
	timer.set_wait_time(spawn_interval)
	
	timer.set_one_shot(false)
	timer.connect("timeout", self, "spawn_enemy")
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func spawn_enemy():
	pass

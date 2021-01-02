extends Node2D

export (NodePath) var collect_sound_object_path
export (NodePath) var suck_sound_object_path

onready var collect_sound = get_node(collect_sound_object_path)
onready var suck_sound = get_node(suck_sound_object_path)


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var collectDone = false
var suckDone = false


# Called when the node enters the scene tree for the first time.
func _ready():
	collect_sound.play()
	suck_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func die():
	if suckDone && collectDone: queue_free()

func _on_Suck_finished():
	suckDone = true

func _on_Collect_finished():
	collectDone = true

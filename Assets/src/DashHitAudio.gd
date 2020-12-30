extends Node2D

export (NodePath) var dash_hit_sound_object_path

onready var dash_hit_sound = get_node(dash_hit_sound_object_path)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	dash_hit_sound.play()



func _on_AudioStreamPlayer2D_finished():
	queue_free()

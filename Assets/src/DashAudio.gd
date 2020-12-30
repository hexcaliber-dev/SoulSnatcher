extends Node2D

export (NodePath) var dash_sound_object_path

onready var dash_sound = get_node(dash_sound_object_path)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	dash_sound.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AudioStreamPlayer2D_finished():
	queue_free()

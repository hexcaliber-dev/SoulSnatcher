extends Node2D

export (NodePath) var dash_animation_object_path

onready var dash_animation = get_node(dash_animation_object_path)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	dash_animation.play()



func _on_AnimatedSprite_animation_finished():
	queue_free()

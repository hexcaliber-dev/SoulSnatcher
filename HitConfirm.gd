extends Node2D

export (NodePath) var hit_confirm_animation_path


onready var hit_confirm_animation = get_node(hit_confirm_animation_path)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	hit_confirm_animation.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_AnimatedSprite_animation_finished():
	queue_free()

extends Control


export (NodePath) var player_object_path

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_player():
	return get_node(player_object_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

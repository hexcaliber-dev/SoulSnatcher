extends Control

export (NodePath) var player_object_path

export (NodePath) var pause_button
export (NodePath) var pause_menu
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node(pause_button).connect('pressed', self, '_open_pause_menu')

func get_player():
	return get_node(player_object_path)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _open_pause_menu():
	get_node(pause_menu).get_node('PauseMenu').visible = true
	Engine.time_scale = 0

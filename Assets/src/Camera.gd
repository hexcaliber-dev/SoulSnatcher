extends Camera2D

export (NodePath) var playerObjectPath
onready var PlayerObject:= get_node(playerObjectPath)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	drag_margin_h_enabled = false
	drag_margin_v_enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	set_offset(PlayerObject.position)

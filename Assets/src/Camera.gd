extends Camera2D

export (NodePath) var playerObjectPath

export var camera_speed:= 5
export var camera_follow_time:= 0.2

onready var PlayerObject:= get_node(playerObjectPath)
var dashing = false
var first_time = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	drag_margin_h_enabled = false
	drag_margin_v_enabled = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (!dashing):
		pass
	else:
		if (first_time):
			yield(get_tree().create_timer(camera_follow_time), "timeout")
			first_time = false
	set_offset(get_offset().linear_interpolate(PlayerObject.position, delta * camera_speed))

func _on_Player_dash_signal():
	dashing = true
	first_time = true
	

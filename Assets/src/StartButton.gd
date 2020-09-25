extends Button


export var path_to_main_game:= "res://Assets/src/MovementTesting.tscn"
export (NodePath) var light_object_path


export var light_scale_max:= 1
var current_light_scale = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var light_object = get_node(light_object_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("pressed", self, "_button_pressed")


func _button_pressed():
	get_tree().change_scene(path_to_main_game)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (current_light_scale < light_scale_max):
		current_light_scale += 0.01
	light_object.set_texture_scale(current_light_scale)

extends Panel


export var path_to_menu:= "res://Assets/src/TitleScreen.tscn"
onready var resume := get_node("Resume")
onready var quit := get_node("Quit")


export var light_scale_max:= 1
var current_light_scale = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	resume.connect("pressed", self, "_resume_button_pressed")
	quit.connect("pressed", self, "_quit_button_pressed")


func _resume_button_pressed():
	visible = false
	Engine.time_scale = 1
	
func _quit_button_pressed():
	visible = false
	Engine.time_scale = 1
	get_tree().change_scene(path_to_menu)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(ev):
	if ev is InputEventKey and ev.pressed and not ev.echo and ev.scancode == KEY_ESCAPE:
		visible = not visible
		if (visible):
			Engine.time_scale = 0
		else:
			Engine.time_scale = 1
		

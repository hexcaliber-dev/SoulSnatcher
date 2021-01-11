extends Node2D

export (NodePath) var crosshair_sprite_object_path
onready var crosshair_sprite = get_node(crosshair_sprite_object_path)


# Called when the node enters the scene tree for the first time.
func _ready():
	# Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.position = self.get_global_mouse_position()
	
	


func _on_Player_cursor_signal(crosshair_texture):
	# crosshair_sprite.set_texture(crosshair_texture)
	Input.set_custom_mouse_cursor(crosshair_texture)

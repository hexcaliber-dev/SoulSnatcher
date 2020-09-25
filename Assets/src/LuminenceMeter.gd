extends TextureRect

export (NodePath) var player_hud_path

export(Texture) var full10
export(Texture) var full9
export(Texture) var full8
export(Texture) var full7
export(Texture) var full6
export(Texture) var full5
export(Texture) var full4
export(Texture) var full3
export(Texture) var full2
export(Texture) var full1

onready var player_hud = get_node(player_hud_path)

var player

var current_luminence = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player = player_hud.get_player()
	
func _process(delta):
	current_luminence = player.get_current_luminence()
	if (current_luminence <= 0.0): set_texture(null)
	if (current_luminence <= 0.1): set_texture(full1)
	elif (current_luminence <= 0.2): set_texture(full2)
	elif (current_luminence <= 0.3): set_texture(full3)
	elif (current_luminence <= 0.4): set_texture(full4)
	elif (current_luminence <= 0.5): set_texture(full5)
	elif (current_luminence <= 0.6): set_texture(full6)
	elif (current_luminence <= 0.7): set_texture(full7)
	elif (current_luminence <= 0.8): set_texture(full8)
	elif (current_luminence <= 0.9): set_texture(full9)
	else: set_texture(full10)
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

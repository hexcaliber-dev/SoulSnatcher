extends TextureProgress

export var dashNum = 0

export (NodePath) var player_hud_path

onready var player_hud = get_node(player_hud_path)

var player


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player = player_hud.get_player()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		tint_over = Color(1, 1, 1, player.slash_charges > dashNum)

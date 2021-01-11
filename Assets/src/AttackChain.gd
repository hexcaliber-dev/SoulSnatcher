extends TextureRect

export (NodePath) var player_hud_path

onready var player_hud = get_node(player_hud_path)
onready var number = get_node("Number")
export(StreamTexture) var frame0
export(StreamTexture) var frame1
export(StreamTexture) var frame2
export(StreamTexture) var frame3
export(StreamTexture) var frame4

var player

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	player = player_hud.get_player()
	
func _process(_delta):
	number.text = str(player.get_current_attack_chain())
	var cooldown = player.get_attack_chain_cooldown()
	
	if (cooldown >= 0.8):
		texture = frame4
	elif (cooldown >= 0.6):
		texture = frame3
	elif (cooldown >= 0.4):
		texture = frame2
	elif (cooldown >= 0.2):
		texture = frame1
	elif (cooldown >= 0):
		texture = frame0

	visible = cooldown > 0
			


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

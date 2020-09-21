extends Actor
class_name Enemy

export (NodePath) var playerObjectPath

export var speed:= 100
export var wisp_drop_number:= 2

onready var PlayerObject:= get_node(playerObjectPath)
onready var wispScene:= load("res://Assets/src/Wisp.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	velocity = ( PlayerObject.position - position).normalized() * speed

func die():
	# play death Animation
	var wisp_instance = wispScene.instance()
	get_parent().add_child(wisp_instance)
	# wisp_instance.position = position
	wisp_instance.set_position(position)
	yield(get_tree().create_timer(0.2), "timeout") # Temporary until death animation
	queue_free()

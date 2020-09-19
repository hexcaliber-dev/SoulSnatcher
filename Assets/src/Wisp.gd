extends Actor

export (NodePath) var magnetCol
export (NodePath) var realCol

onready var magnetColID:= get_node(magnetCol).get_instance_id()
onready var realColID:  = get_node(realCol).get_instance_id()
var collisionID:int = 0
var inMagRange: = false


func _ready() -> void:
	velocity = 50

func _physics_process(delta: float) -> void:
	collisionID = move_and_collide(velocity).get_collider_id()
	if (collisionID == realColID):
		queue_free()
	elif (collisionID == magnetColID):
			inMagRange = true
	else:
		inMagRange = false

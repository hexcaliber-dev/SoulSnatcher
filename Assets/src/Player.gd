extends Actor

var vertical_input_strength
var horizontal_input_strength
var current_vertical_speed = Vector2(0, 0)
var current_horizontal_speed = Vector2(0, 0)
var direction

export var speed:= 500
export var drag_weight:= 10



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	vertical_input_strength = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	horizontal_input_strength = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction = Vector2(horizontal_input_strength, vertical_input_strength).normalized()
	velocity = velocity.linear_interpolate( direction*speed, delta*drag_weight )

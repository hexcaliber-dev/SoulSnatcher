extends Actor

enum ATTACK_STATE {NEUTRAL, DASHING, DASHED}

var vertical_input_strength
var horizontal_input_strength
var current_vertical_speed = Vector2(0, 0)
var current_horizontal_speed = Vector2(0, 0)
var direction
var attack_state = ATTACK_STATE.NEUTRAL

export var speed:= 500
export var drag_weight:= 10



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	if(attack_state == ATTACK_STATE.DASHING):
		velocity = 0
		pass
	elif (Input.get_action_strength("Dash")):
		attack_state = ATTACK_STATE.DASHING
		dash()
	else:
		movement(delta)
	print( get_viewport().get_mouse_position() )
func dash():
	pass
func movement(delta):
	vertical_input_strength = Input.get_action_strength("Down") - Input.get_action_strength("Up")
	horizontal_input_strength = Input.get_action_strength("Right") - Input.get_action_strength("Left")
	direction = Vector2(horizontal_input_strength, vertical_input_strength).normalized()
	velocity = velocity.linear_interpolate( direction*speed, delta*drag_weight )

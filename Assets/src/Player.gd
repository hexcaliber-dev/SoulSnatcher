extends Actor

var vertical_input_strength
var horizontal_input_strength
var current_vertical_speed = Vector2(0, 0)
var current_horizontal_speed = Vector2(0, 0)
var direction

export var speed:= 500
export var drag_weight:= 10
export var dash_start_time:= 0.2

signal dash_signal

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

func dash():
	yield(get_tree().create_timer(dash_start_time), "timeout")
	emit_signal("dash_signal")
	var radians = get_angle_to(get_global_mouse_position())
	position += Vector2(cos(radians), sin(radians)) * 400
	attack_state = ATTACK_STATE.NEUTRAL
	# position += get_angle_to(get_global_mouse_position())
	

func _on_DashCast_dashPressed(objectHit):
	if (attack_state != ATTACK_STATE.DASHING):
		# if(objectHit != null): Uncomment when want only when hitting enemy
			attack_state = ATTACK_STATE.DASHING
			dash()

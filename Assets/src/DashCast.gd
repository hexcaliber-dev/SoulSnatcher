extends RayCast2D

signal dashPressed(objectHit)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.get_action_strength("Dash")):
		print(is_colliding())
		if( is_colliding() ):
			emit_signal("dashedPressed", get_collider() )

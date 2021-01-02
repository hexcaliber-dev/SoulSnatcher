extends RayCast2D

signal dashPressed(objectHit)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Input.is_action_just_released("Dash")):
		# print("hello")
		#if( is_colliding() ): Uncomment when want only when hitting enemy
		emit_signal("dashPressed", get_collider() )

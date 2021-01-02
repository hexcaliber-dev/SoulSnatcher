extends KinematicBody2D
class_name Actor

var velocity = Vector2.ZERO


# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.set_target_fps(Engine.get_iterations_per_second())


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _physics_process(_delta):
	move_and_slide(velocity)

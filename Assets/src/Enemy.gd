extends Actor
class_name Enemy



export var speed:= 100
export var wisp_drop_number:= 2

var PlayerObject
onready var wispScene:= load("res://Assets/src/Wisp.tscn")


var dead = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func init(player):
	PlayerObject = player

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(_delta):
	if PlayerObject != null:
		velocity = ( PlayerObject.position - position).normalized() * speed
		look_at(PlayerObject.position)
		if(get_slide_count() > 0):
			var collision_info = get_slide_collision(0)
			if collision_info and collision_info.get_collider() is Player:
				print("Player Hit")
	else:
		PlayerObject = get_parent().get_node("Player")

func die():
	if (!dead):
		dead = true
		# play death Animation
		
		if PlayerObject != null:
			yield(get_tree().create_timer(PlayerObject.dash_start_time), "timeout")
		var wisp_instance = wispScene.instance()
		
		
		# wisp_instance.position = position
		wisp_instance.set_position(position)
		
		yield(get_tree().create_timer(0.2), "timeout") # Temporary until death animation
		get_parent().add_child(wisp_instance)
		queue_free()

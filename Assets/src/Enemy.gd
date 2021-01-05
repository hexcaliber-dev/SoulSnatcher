extends Actor
class_name Enemy



export var speed:= 100
export var wisp_drop_number:= 1
export (NodePath) var light_coverPath
export (NodePath) var light_path
export (float) var cover_intensity := 1.0
export (float) var extra_dist_offset := 35
var PlayerObject


onready var wispScene:= load("res://Assets/src/Wisp.tscn")
onready var light_cover := get_node(light_coverPath)
onready var light := get_node(light_path)
onready var global_vars = get_node("/root/Global")

var dead = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func init(player):
	PlayerObject = player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(_delta):
	
	if PlayerObject != null:
		velocity = ( PlayerObject.position - position).normalized() * speed
		look_at(PlayerObject.position)
		if(get_slide_count() > 0):
			var collision_info = get_slide_collision(0)
			if collision_info and collision_info.get_collider() is Player:
				# print("Player Hit")
				pass
	else:
		PlayerObject = get_parent().get_node("Player")
		
	light_cover.modulate.a = 1.0
	#print(global_vars.lights_array.size())
	
	for lights in global_vars.lights_array:
		if (light != lights): # if the light isn't the enemy light
			light_cover.modulate.a = min(light_cover.modulate.a, calcAlphaValue(lights))

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

func calcAlphaValue(light2 : Light2D) -> float:
	var dist := global_position.distance_to(light2.global_position)
	var lum : float = light2.get_texture_scale()*light2.get_texture().get_height()/2
	var dist_offset : float = light.get_texture_scale()*light.get_texture().get_height()/2
	var e := VisualScriptMathConstant.MATH_CONSTANT_E
	var logistic := 1/(1 + pow(e, -cover_intensity*(dist-lum-dist_offset-extra_dist_offset)))
	return logistic

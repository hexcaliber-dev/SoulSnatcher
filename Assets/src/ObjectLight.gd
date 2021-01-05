extends Light2D

export var in_global_list = true

onready var global_vars = get_node("/root/Global")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_VisibilityNotifier2D_screen_entered() -> void:
	if (in_global_list):
		global_vars.lights_array.append(self)


func _on_VisibilityNotifier2D_screen_exited() -> void:
	if (in_global_list):
		global_vars.lights_array.remove(global_vars.lights_array.find(self))

extends Node2D


export var delay_seconds := 15
var enabled := true

func _ready():
	for frame_freezer in get_tree().get_nodes_in_group("frame_freezer"):
		print("Giving function")
		print(frame_freezer)
		frame_freezer.connect("frame_freeze_requested", self, "_on_frame_freeze_requested")



func _on_frame_freeze_requested():
	if not enabled:
		return
	print("Freeze")
	OS.delay_msec(delay_seconds)

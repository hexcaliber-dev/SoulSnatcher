extends Actor
class_name Wisp
# movement speed when directing to player
export var speed := 500
export var increase_luminence_amount:= 20

onready var soulCollectScene := load("res://Assets/src/SoulCollect.tscn")

# current player in range
var player:Actor = null

func _process(delta):
	pass
	
# If player in range, moves toward player; if not, slows to stop
func _physics_process(_delta: float) -> void:
	if player:
		velocity = position.direction_to(player.position).normalized() * speed
	else:
		if (velocity.length() < speed):
			velocity = velocity - velocity.normalized() * speed
		else:
			velocity = Vector2.ZERO
	move_and_slide(velocity)

# If a player enters magnet range, is detected
func _on_Magnet_body_entered(body: Node) -> void:
	yield(get_tree().create_timer(1), "timeout")
	player = body as Actor

# If a player leaves magnet range, no longer is detected
func _on_Magnet_body_exited(body: Node) -> void:
	player = null

# If a player comes into contact with wisp, wisp will disappear
func _on_PlayerTouch_body_entered(body: Node) -> void:
	yield(get_tree().create_timer(0.1), "timeout")
	if (body is Player):
		var soul_collect_instance = soulCollectScene.instance()
		soul_collect_instance.set_position(position)
		get_parent().add_child(soul_collect_instance)
		body.increase_luminence(increase_luminence_amount)
		queue_free()

extends Actor

# movement speed when directing to player
export var speed := 500

# current player in range
var player:Actor = null

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
	player = body as Actor

# If a player leaves magnet range, no longer is detected
func _on_Magnet_body_exited(body: Node) -> void:
	player = null

# If a player comes into contact with wisp, wisp will disappear
func _on_PlayerTouch_body_entered(body: Node) -> void:
	queue_free()

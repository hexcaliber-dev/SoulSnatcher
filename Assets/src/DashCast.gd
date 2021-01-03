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
		
		var objects_collide = [] #The colliding objects go here.
		while is_colliding():
			var obj = get_collider() #get the next object that is colliding.
			objects_collide.append( obj ) #add it to the array.
			add_exception( obj ) #add to ray's exception. That way it could detect something being behind it.
			force_raycast_update() #update the ray's collision query.
	
	#after all is done, remove the objects from ray's exception.
		for obj in objects_collide:
			remove_exception( obj )
		
		emit_signal("dashPressed", objects_collide )

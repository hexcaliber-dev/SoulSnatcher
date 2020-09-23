extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()
var min_x
var min_y
var max_x
var max_y
var time = 0
var generation_speed = 0.05

onready var tile_ids_array = tile_set.get_tiles_ids()

#func set_cell(x, y, tile, flip_x=false, flip_y=false, transpose=false, autotile_coord=Vector2()):
#	rng.randi_range(0, 1)
#	#set_cell(x, y, tile_ids_array[ rng.randi_range(0, 1) % tile_ids_array.size()], flip_x, flip_y, transpose, autotile_coord)


# Called when the node enters the scene tree for the first time.
func _ready():
	var cells = get_used_cells()
	min_x = cells[0].x
	max_x = cells[0].x
	min_y = cells[0].y
	max_y = cells[0].y
	for cell in cells:
		min_x = cell.x if cell.x < min_x else min_x
		max_x = cell.x if cell.x > max_x else max_x
		min_y = cell.y if cell.y < min_y else min_y
		max_y = cell.y if cell.y > max_y else max_y
		set_cell(cell.x, cell.y, rng.randi_range(0, tile_ids_array.size()-1) )
	print(min_x)
	print(max_x)
	print(min_y)
	print(max_y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (Input.get_action_strength("Right") > 0):
		time += delta
		if (time > generation_speed):
			max_x += 1
			for a in range(min_y-1, max_y+1):
				set_cell(max_x, a, rng.randi_range(0, tile_ids_array.size()-1) )
			time = 0
	if ( Input.get_action_strength("Left") > 0 ):
		time += delta
		if (time > generation_speed):
			min_x -= 1
			for a in range(min_y-1, max_y+1):
				set_cell(min_x, a, rng.randi_range(0, tile_ids_array.size()-1) )
			time = 0
	if (Input.get_action_strength("Up") > 0):
		time += delta
		if (time > generation_speed):
			min_y -= 1
			for a in range(min_x-1, max_x+1):
				set_cell(a, min_y, rng.randi_range(0, tile_ids_array.size()-1) )
			time = 0
	if (Input.get_action_strength("Down") > 0):
		time += delta
		if (time > generation_speed):
			max_y += 1
			for a in range(min_x-1, max_x+1):
				set_cell(a, max_y, rng.randi_range(0, tile_ids_array.size()-1) )
			time = 0
		
	# time+=delta

extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var rng = RandomNumberGenerator.new()

onready var tile_ids_array = tile_set.get_tiles_ids()

#func set_cell(x, y, tile, flip_x=false, flip_y=false, transpose=false, autotile_coord=Vector2()):
#	rng.randi_range(0, 1)
#	#set_cell(x, y, tile_ids_array[ rng.randi_range(0, 1) % tile_ids_array.size()], flip_x, flip_y, transpose, autotile_coord)


# Called when the node enters the scene tree for the first time.
func _ready():
	var cells = get_used_cells()
	
	print(cells)
	for cell in cells:
		set_cell(cell.x, cell.y, rng.randi_range(0, tile_ids_array.size()-1) )


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

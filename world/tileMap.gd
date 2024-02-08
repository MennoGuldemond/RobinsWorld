extends TileMap

const ground_layer = 0
const object_layer = 1
const overhead_layer = 2

const grass_index = Vector2i(6, 1)
const dirt_index = Vector2i(11, 5)

var rng = RandomNumberGenerator.new()
var tile_data: Array = []


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass

func generate(cell_size: Vector2i):
	# Generate world (store in array)
	for i in cell_size.x:
		tile_data.append([]) # append new row to the array for 2D effect
		for j in cell_size.y:
			var value = rng.randi_range(0, 2)
			tile_data[i].append(value)
			if (randf() > 0.2):
				set_cell(ground_layer, Vector2i(i, j), 3, grass_index)
			else:
				set_cell(ground_layer, Vector2i(i, j), 3, dirt_index)

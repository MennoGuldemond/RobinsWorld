extends TileMap

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()

const ground_layer = 0
const object_layer = 1
const overhead_layer = 2

const grass_index = Vector2i(6, 1)
const dirt_index = Vector2i(11, 5)

@export var width: int = 15
@export var height: int = 15

@onready var player = $"../Player"

var rng = RandomNumberGenerator.new()
var tile_data: Array = []

func _ready():
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()
	altitude.frequency = 0.005
	
	# Generate world (store in array)
	#for i in grid_width:
		#tile_data.append([]) # append new row to the array for 2D effect
		#for j in grid_height:
			#var value = rng.randi_range(0, 2)
			#tile_data[i].append(value)
			#if (randf() > 0.2):
				#set_cell(ground_layer, Vector2i(i, j), 3, grass_index)
			#else:
				#set_cell(ground_layer, Vector2i(i, j), 3, dirt_index)


func _process(delta):
	generate_chunk(player.position)


func generate_chunk(position):
	var tile_pos = local_to_map(position)
	for x in range(width):
		for y in range(height):
			#var moist = moisture.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)*10
			#var temp = temperature.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)*10
			var alt = altitude.get_noise_2d(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y)*10
			
			if alt < 2:
				set_cell(ground_layer, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y), 3, grass_index)
			else:
				set_cell(ground_layer, Vector2i(tile_pos.x-width/2 + x, tile_pos.y-height/2 + y), 3, dirt_index)

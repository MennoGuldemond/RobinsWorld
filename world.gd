extends TileMap

const ground_layer = 0
const object_layer = 1
const overhead_layer = 2

const grass_index = Vector2i(6, 1)
const dirt_index = Vector2i(11, 5)

@export var grid_width: int = 10
@export var grid_height: int = 10

@onready var taskManager = $".." as TaskManager

var rng = RandomNumberGenerator.new()
var tile_data: Array = []

func _ready():
	# Generate world (store in array)
	for i in grid_width:
		tile_data.append([]) # append new row to the array for 2D effect
		for j in grid_height:
			var value = rng.randi_range(0, 2)
			tile_data[i].append(value)
			if (randf() > 0.2):
				set_cell(ground_layer, Vector2i(i, j), 3, grass_index)
			else:
				set_cell(ground_layer, Vector2i(i, j), 3, dirt_index)


func _process(delta):
	#print(get_global_mouse_position())
	pass


func _input(event):
	if Input.is_action_just_pressed("click"):
		var tile_pos = local_to_map(get_global_mouse_position())
		taskManager.on_target_set(get_global_mouse_position())
		#set_cell(ground_layer, tile_pos, 3, grass_index)

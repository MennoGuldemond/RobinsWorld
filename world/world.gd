extends Node2D

@onready var line_2d = $"./Line2D"
@export var isDebug = false
@export var cell_size = Vector2i(64, 64)

var astar_grid = AStarGrid2D.new()
var grid_size

var start = Vector2i.ZERO
var end = Vector2i(5, 5)

func _ready():
	initialize_grid()
	if (isDebug):
		update_path()

func _draw():
	if (isDebug):
		fill_walls()
		draw_grid()
		draw_rect(Rect2(start * cell_size, cell_size), Color.GREEN_YELLOW)
		draw_rect(Rect2(end * cell_size, cell_size), Color.ORANGE_RED)

func fill_walls():
	for x in grid_size.x:
		for y in grid_size.y:
			if astar_grid.is_point_solid(Vector2i(x, y)):
				draw_rect(Rect2(x * cell_size.x, y * cell_size.y, cell_size.x, cell_size.y), Color.DARK_GRAY)


func initialize_grid():
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	grid_size = Vector2i(get_viewport_rect().size) / cell_size
	astar_grid.size = grid_size
	astar_grid.cell_size = cell_size
	astar_grid.offset = cell_size / 2
	astar_grid.update()


func set_cell_solid(pos: Vector2i):
	if astar_grid.is_in_boundsv(pos):
		astar_grid.set_point_solid(pos, not astar_grid.is_point_solid(pos))
		update_path()
		queue_redraw()

func update_path():
	line_2d.points = PackedVector2Array(astar_grid.get_point_path(start, end))

func draw_grid():
	for x in grid_size.x + 1:
		draw_line(Vector2(x * cell_size.x, 0),
			Vector2(x * cell_size.x, grid_size.y * cell_size.y),
			Color.DARK_GRAY, 2.0)
	for y in grid_size.y + 1:
		draw_line(Vector2(0, y * cell_size.y),
			Vector2(grid_size.x * cell_size.x, y * cell_size.y),
			Color.DARK_GRAY, 2.0)

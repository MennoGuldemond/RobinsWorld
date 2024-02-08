class_name Pawn
extends Node2D

@export var move_speed = 100
@onready var taskManager = $".." as TaskManager

var target_position: Vector2i


func _ready():
	taskManager.connect("set_target", _on_set_target)


func _process(delta):
	if (target_position):
		global_position = global_position.move_toward(target_position, move_speed * delta)


func _on_set_target(target):
	target_position = target

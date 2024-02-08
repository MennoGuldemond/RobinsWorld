class_name TaskManager
extends Node2D

signal set_target(target: Vector2i)

func on_target_set(target: Vector2i):
	set_target.emit(target)

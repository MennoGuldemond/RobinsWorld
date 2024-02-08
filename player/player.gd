class_name Pawn
extends CharacterBody2D

@export var move_speed = 200


func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * move_speed
	move_and_slide()

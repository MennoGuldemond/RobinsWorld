extends Camera2D

var ZoomMin = Vector2(0.25,0.25)
var ZoomMax = Vector2(2.5,2.5)
var ZoomSpd = Vector2(0.3,0.3)
var PanSpeedKey = 8


func _input(event):
	#if event.is_action_pressed("ScrollZoomOut"):
		#if zoom > ZoomMin:
			#zoom -= ZoomSpd
	#if event.is_action_pressed("ScrollZoomIn"):
		#if zoom < ZoomMax:
			#zoom +=ZoomSpd
	pass


func _process(_delta):
	if Input.is_action_pressed("up"):
		position.y -= PanSpeedKey
	if Input.is_action_pressed("down"):
		position.y += PanSpeedKey
	if Input.is_action_pressed("left"):
		position.x -= PanSpeedKey
	if Input.is_action_pressed("right"):
		position.x += PanSpeedKey
	pass

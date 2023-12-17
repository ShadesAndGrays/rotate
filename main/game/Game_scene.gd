extends Node2D

@export var Shape_holder:shape_holder 
@export var sprite1:Sprite2D
@export var sprite2:Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if !Shape_holder:
		print("Please add a valid shape holder")
		queue_free()
		return
	start_round()
	pass # Replace with function body.

func start_round():
	if !sprite1 or !sprite2:
		print("Please include a sprite or render to")
		queue_free()
		return
	var texture = Shape_holder.get_shape()
	if texture:
		sprite1.texture = texture
		sprite2.texture = texture
	else: print("Failed to load texture")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_left_button_pressed() -> void:
	sprite1.rotation_degrees -= 45
	pass # Replace with function body.


func _on_right_button_2_pressed() -> void:
	sprite1.rotation_degrees += 45
	pass # Replace with function body.

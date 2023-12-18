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
	randomize_rotation(sprite1)

func end_round():
	sprite1.texture = null
	sprite2.texture = null
	
	pass
func check_rotations():
	if sprite1.rotation_degrees == sprite2.rotation_degrees:
		end_round()

func randomize_rotation(node:Node2D):
	var random_rotate = [1,2,3,4,5]
	random_rotate.shuffle()
	for i in range(0,len(random_rotate)):
		if i %2 ==0:
			left_rotate(node)
		else:
			right_rotate(node)
		pass
	print(random_rotate)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func left_rotate(node:Node2D,angle:float = 45):
	node.rotation_degrees -= angle

func right_rotate(node:Node2D,angle:float = 45):
	node.rotation_degrees += angle
	
func _on_left_button_pressed() -> void:
	left_rotate(sprite1)
	pass # Replace with function body.


func _on_right_button_2_pressed() -> void:
	right_rotate(sprite1)
	pass # Replace with function body.


func _on_button_3_pressed() -> void:
	check_rotations()
	pass # Replace with function body.

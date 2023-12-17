extends Resource
class_name shape_holder

@export var shapes :Array[shape_resource]
var used_shapes:Array[shape_resource]

func get_shape():
	if shapes.is_empty():
		return null
	var shape = shapes[0].shape_texture
	#used_shapes.append(shapes.pop_front())
	return shape
	

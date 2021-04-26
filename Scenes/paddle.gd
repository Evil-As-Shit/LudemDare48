extends KinematicBody2D

onready var path = get_node("../../PathFollow2D")

func _ready():
	pass
func _process(delta):
	var mouse_x = get_viewport().get_mouse_position().x
	var unit_width = (mouse_x-140)/(590-140)
	path.set_unit_offset(unit_width)

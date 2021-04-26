extends StaticBody2D

onready var focus = get_tree().root.get_child(0).focus
onready var face = get_node("Head")

func _physics_process(delta):
	if(focus < 50 and focus > 40):
		print(focus)
		face.set_frame(3)
		pass
	pass

extends Area2D

var orgin = Vector2(360,408)
var speed = 400
onready var world = get_tree().root.get_child(1)

func _ready():
	pass 

func _physics_process(delta):
	position = position.move_toward(orgin,delta*speed)
	


func _on_Thoughts_body_entered(body):
	if(body.name == "Head"):
		world.focus -= 3
	if(body.name == "paddle"):
		pass
	queue_free()
	print(body.name)
	pass # Replace with function body.

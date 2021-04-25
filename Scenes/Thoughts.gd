extends Area2D

var orgin = Vector2(360,408)
var speed = 400
func _ready():
	pass 

func _physics_process(delta):
	position = position.move_toward(orgin,delta*speed)
	


func _on_Thoughts_body_entered(body):
	queue_free()
	print(body.name)
	pass # Replace with function body.

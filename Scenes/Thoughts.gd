extends Area2D

var sound = null
var orgin = Vector2(360,408)
var speed = 200
onready var world = get_tree().root.get_child(2)

func _ready():
	randomize()
	pass 

func _physics_process(delta):
	position = position.move_toward(orgin,delta*speed)

func _on_Thoughts_body_entered(body):
	if(body.name == "Head"):
		world.focus -= 2
		if(world.focus > 40):
			world.face.play("upset")
			yield(world.face,"animation_finished")
			world.face.stop()
			world.face.play("default")
			world.face.stop()
			world.face.set_frame(4)
	if(body.name == "paddle"):
		playSound()
		Global.score += 1
		pass
	queue_free()
	pass # Replace with function body.

func playSound():
	var val = randi()%11+1
	if(val == Global.temp):
		print("try again")
		playSound()
	else:
		Global.temp = val
		sound = get_node("../../sounds/"+str(val))
		sound.play()

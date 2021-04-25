extends Node

var score = 0
const thought = preload("res://Scenes/Thoughts.tscn")
var orgin = Vector2(360,408)
var reset = false
onready var timer = get_node("Timer")

func _ready():
	randomize()

func _physics_process(delta):
	if(reset == false):
		reset == true
	elif(reset == true):
		pass

func spawnThought():
	var screen_size = get_viewport().get_visible_rect().size
	var new_thought = thought.instance()
	var side = randi()%3+1
	var pos = Vector2()
	if(side == 1):
		pos.x = -64
		pos.y = rand_range(-64,300)
		pass
	if(side == 2):
		pos.x = rand_range(-64,768)
		pos.y = -64
		pass
	if(side == 3):
		pos.x = 768
		pos.y = rand_range(-64,300)
	new_thought.set_position(pos)
	get_node("Control").add_child(new_thought)

func _on_Timer_timeout():
	spawnThought()
	reset = false

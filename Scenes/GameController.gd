extends Node

var focus = 50
const thought = preload("res://Scenes/Thoughts.tscn")
var orgin = Vector2(360,408)
var reset = false
onready var timer = get_node("Timer")
onready var label = get_node("RichTextLabel")
onready var face = get_node("Head/Head")
onready var bg = get_node("BG")
func _ready():
	randomize()
	SilentWolf.configure({
		  "api_key": "Lxi8p8nrJD84i08qavmCQ4tXEmGwgM4W8WQ9QcAw",
		  "game_id": "LudemDare48",
		  "game_version": "0.0.0",
		  "log_level": 1
		})

	SilentWolf.configure_scores({
		  "open_scene_on_close": "res://Scenes/Main.tscn"
		})


func _physics_process(delta):
	focus += 2*delta
	label.set_text(str(focus))
	if(reset == false):
		reset == true
	elif(reset == true):
		pass
	if(focus > 90):
		bg.set_frame(4) 
	if(focus > 80 and focus < 90):
		bg.set_frame(3) 
	if(focus > 70 and focus < 80):
		bg.set_frame(2) 
	if(focus > 60 and focus < 70):
		bg.set_frame(1) 
	if(focus < 60):
		bg.set_frame(0)
	if(focus > 50):
		face.set_frame(4)
	if(focus < 50 and focus > 40):
		face.set_frame(3)
	if(focus < 40 and focus > 30):
		face.set_frame(2)
	if(focus < 30 and focus > 20):
		face.set_frame(1)
	if(focus < 20 and focus > 10):
		face.set_frame(0)

func spawnThought():
	var screen_size = get_viewport().get_visible_rect().size
	var new_thought = thought.instance()
	new_thought.get_node("Sprite").set_frame(rand_range(0,5))
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

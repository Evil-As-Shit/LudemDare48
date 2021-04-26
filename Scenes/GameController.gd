extends Node

var focus = 0
const thought = preload("res://Scenes/Thoughts.tscn")
var orgin = Vector2(360,408)
#var reset = false
onready var timer = get_node("Thought_Timer")
onready var gametime = get_node("Game_Timer")
onready var focuslabel = get_node("focus")
onready var gametimelabel = get_node("gametime")
onready var face = get_node("Head/Head")
onready var bg = get_node("BG")

func _ready():
	Global.score = 0
	randomize()

func _physics_process(delta):
	focus += 2*delta
	focuslabel.set_text(str(Global.score))
	gametimelabel.set_text(str(int(gametime.time_left)))
	if(int(gametime.time_left) == 0):
		timer.stop()
		gametime.stop()
		get_tree().change_scene("res://Scenes/End.tscn")
		pass
#	if(reset == false):
#		reset == true
#	elif(reset == true):
#		pass
	if(focus > 90):
		timer.set_wait_time(0.15)
		bg.set_frame(4) 
	if(focus <90 and focus > 80):
		timer.set_wait_time(0.2)
		bg.set_frame(3) 
	if(focus < 80 and focus > 70):
		timer.set_wait_time(0.25)
		bg.set_frame(2) 
	if(focus < 70 and focus > 60):
		timer.set_wait_time(0.31)
		bg.set_frame(1) 
	if(focus < 60 and focus > 50):
		timer.set_wait_time(0.34)
		bg.set_frame(0)
	if(focus < 50 and focus > 40):
		timer.set_wait_time(0.37)
		face.set_frame(4)
	if(focus < 40 and focus > 30):
		timer.set_wait_time(0.41)
		face.set_frame(3)
	if(focus < 30 and focus > 20):
		timer.set_wait_time(0.44)
		face.set_frame(2)
	if(focus < 20 and focus > 10):
		timer.set_wait_time(0.47)
		face.set_frame(1)
	if(focus <10):
		timer.set_wait_time(0.5)
		face.set_frame(0)

func spawnThought():
	var screen_size = get_viewport().get_visible_rect().size
	var new_thought = thought.instance()
	new_thought.get_node("Sprite").set_frame(rand_range(0,6))
	var side = randi()%3+1
	var pos = Vector2()
	if(side == 1):
		pos.x = -64
		pos.y = rand_range(-64,200)
		pass
	if(side == 2):
		pos.x = rand_range(-64,768)
		pos.y = -64
		pass
	if(side == 3):
		pos.x = 768
		pos.y = rand_range(-64,200)
	new_thought.set_position(pos)
	get_node("Control").add_child(new_thought)

func _on_Timer_timeout():
	spawnThought()
	print(timer.wait_time)
#	reset = false

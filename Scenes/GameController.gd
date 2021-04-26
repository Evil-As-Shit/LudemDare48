extends Node
var speed = null
var sound = null
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
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Global.score = 0
	randomize()
	playSound()

func _physics_process(delta):
#	if Input.is_action_just_pressed("ui_cancel"):
#		get_tree().change_scene("res://scenes/Menu.tscn")
	focus += 3*delta
	focuslabel.set_text(str(Global.score))
	gametimelabel.set_text(str(int(gametime.time_left)))
	if(int(gametime.time_left) == 0):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		timer.stop()
		gametime.stop()
		get_tree().change_scene("res://Scenes/End.tscn")
	if(focus > 90):
		timer.set_wait_time(0.2)
		bg.set_frame(4)
		speed = 475
	if(focus <90 and focus > 80):
		timer.set_wait_time(0.22)
		bg.set_frame(3) 
		speed = 450
	if(focus < 80 and focus > 70):
		timer.set_wait_time(0.25)
		bg.set_frame(2) 
		speed = 425
	if(focus < 70 and focus > 60):
		timer.set_wait_time(0.31)
		bg.set_frame(1) 
		speed = 400
	if(focus < 60 and focus > 50):
		timer.set_wait_time(0.34)
		bg.set_frame(0)
		speed = 375
	if(focus < 50 and focus > 40):
		timer.set_wait_time(0.37)
		face.set_frame(4)
		speed = 350
	if(focus < 40 and focus > 30):
		timer.set_wait_time(0.41)
		face.set_frame(3)
		speed = 325
	if(focus < 30 and focus > 20):
		timer.set_wait_time(0.44)
		face.set_frame(2)
		speed = 300
	if(focus < 20 and focus > 10):
		timer.set_wait_time(0.47)
		face.set_frame(1)
		speed = 275
	if(focus <10):
		timer.set_wait_time(0.5)
		face.set_frame(0)
		speed = 250

func spawnThought():
	var screen_size = get_viewport().get_visible_rect().size
	var new_thought = thought.instance()
	new_thought.speed = speed
	new_thought.get_node("Sprite").set_frame(rand_range(0,12))
	var item = new_thought.get_node("Sprite").frame
	var extents = Vector2()
	if(item == 0):
		extents = Vector2(25,45)
	if(item == 1):
		extents = Vector2(22,27)
	if(item == 2):
		extents = Vector2(20,31)
		new_thought.get_node("CollisionShape2D").rotation_degrees = -27.3
	if(item == 3):
		extents = Vector2(17,23)
		new_thought.get_node("CollisionShape2D").rotation_degrees = 60
	if(item == 4):
		extents = Vector2(17,23)
		new_thought.get_node("CollisionShape2D").rotation_degrees = 21.8
	if(item == 5):
		extents = Vector2(20,31)
	if(item == 6):
		extents = Vector2(16,16)
	if(item == 7):
		extents = Vector2(18,35)
	if(item == 8):
		extents = Vector2(5.25,27.80)
	if(item == 9):
		extents = Vector2(12.5,33)
		new_thought.get_node("CollisionShape2D").rotation_degrees = 60
	if(item == 10):
		extents = Vector2(12.5,25)
	if(item == 11):
		extents = Vector2(18,25)
		new_thought.get_node("CollisionShape2D").rotation_degrees = -27
	new_thought.get_node("CollisionShape2D").get_shape().set_extents(extents)
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

func playSound():
	var val = randi()%11+1
	sound = get_node("sounds/"+str(val))
	sound.play()

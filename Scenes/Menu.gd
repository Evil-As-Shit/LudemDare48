extends Node2D
onready var lab = get_node("Label")
onready var icon = load("res://Assests/mediationicon.png")
var sound = null

func _ready():
	randomize()
	playSound()
	print(Global.submit)
#	SilentWolf.Scores.wipe_leaderboard()
	SilentWolf.configure({
		  "api_key": "Lxi8p8nrJD84i08qavmCQ4tXEmGwgM4W8WQ9QcAw",
		  "game_id": "LudemDare48",
		  "game_version": "0.0.0",
		  "log_level": 1
		})
	SilentWolf.configure_scores({
		  "open_scene_on_close": "res://Scenes/Main.tscn"
		})

func _input(event):
	if event is InputEventScreenTouch:
		print("using touch screen")
		Global.touch = true

func _on_TextureButton_pressed():
	playSound()
	get_tree().change_scene("res://Scenes/Main.tscn")
	pass # Replace with function body.

func _on_TextureButton2_pressed():
	get_tree().change_scene("res://Scenes/HighScores.tscn")
	pass # Replace with function body.

func playSound():
	var val = randi()%11+1
	sound = get_node("sounds/"+str(val))
	sound.play()

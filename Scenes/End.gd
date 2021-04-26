extends Node2D

onready var textedit = get_node("LineEdit")
var current_text = ""
var cursor_line = 0
var cursor_column = 0
var sound = null
onready var your_score = get_node("NinePatchRect/Label")

func _ready():
	connect("focus_entered", self, "js_text_entry")
	randomize()
	playSound()
	your_score.set_text("You Deflected " + str(Global.score) + " Distracting Thoughts!")


func _on_TextureButton2_pressed():
	get_tree().get_root().set_disable_input(true)
	Global.player_name = textedit.text
	print(Global.player_name)
	SilentWolf.Scores.persist_score(Global.player_name, Global.score)
	var t = Timer.new()
	t.set_wait_time(0.5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_tree().get_root().set_disable_input(false)
	get_tree().change_scene("res://Scenes/HighScores.tscn")

func playSound():
	var val = randi()%11+1
	sound = get_node("sounds/"+str(val))
	sound.play()

func js_text_entry():
	current_text = JavaScript.eval("prompt('%s', '%s');" % ["Please enter text:", current_text], true)

func _on_LineEdit_focus_entered():
	js_text_entry()
	pass # Replace with function body.

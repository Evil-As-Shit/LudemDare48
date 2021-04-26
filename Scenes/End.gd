extends Node2D

onready var textedit = get_node("LineEdit")
var current_text = ""
var cursor_line = 0
var cursor_column = 0
var sound = null
onready var your_score = get_node("NinePatchRect/Label")
onready var buttontext = get_node("TextureButton2/Label")
func _ready():
	randomize()
	playSound()
	your_score.set_text("You Deflected " + str(Global.score) + " Distracting Thoughts!")
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_node("LineEdit").grab_focus()
func _on_TextureButton2_pressed():
	get_tree().get_root().set_disable_input(true)
	Global.player_name = textedit.text
	SilentWolf.Scores.persist_score(Global.player_name, Global.score)
	get_tree().get_root().set_disable_input(false)
	get_tree().change_scene("res://Scenes/HighScores.tscn")

func playSound():
	var val = randi()%11+1
	sound = get_node("sounds/"+str(val))
	sound.play()

func js_text_entry():
	current_text = JavaScript.eval("prompt('%s', '%s');" % ["Enter Your Name:", current_text], true)
	textedit.set_text(current_text)

func _on_LineEdit_focus_entered():
	if(Global.touch == true):
		js_text_entry()
		textedit.hide()
		textedit.show()


func _on_LineEdit_text_changed(new_text):
	if(textedit.text == ""):
		buttontext.set_text("High Scores")
		Global.submit = false
	else:
		buttontext.set_text("Submit Score")
		Global.submit = true

extends Node2D

var sound = null
onready  var label_names = get_node("NinePatchRect/names")
onready var label_scores = get_node("NinePatchRect/scores")
var names = []
var scores = []
var pos = []

func _ready():
	randomize()
	playSound()
	if(Global.submit == false):
		print("top 10")
		var names = []
		var scores = []
		yield(SilentWolf.Scores.get_high_scores(10), "sw_scores_received")
		for i in SilentWolf.Scores.scores:
			names.append(str(i["player_name"]))
			scores.append(str(i["score"]))
		print(names)
		print(scores)
		var text = ""
		var i = 0
		for name in names:
			i += 1
			text = text + str(i) +". " + str(name) + "\n"
		label_names.set_text(text)
		text = ""
		for score in scores:
			text = text + str(score) + "\n" 
		label_scores.set_text(text)
	if(Global.submit == true):
		print("scores around")
		yield(SilentWolf.Scores.get_scores_around(Global.score, 5), "sw_scores_around_received")
		for k in SilentWolf.Scores.scores_above:
			names.append(str(k["player_name"]))
			scores.append(str(k["score"]))
			pos.append(str(k["position"]))
		for o in SilentWolf.Scores.scores_below:
			names.append(str(o["player_name"]))
			scores.append(str(o["score"]))
			pos.append(str(o["position"]))
		print(names)
		print(scores)
		print(pos)
		var text = ""
		var i = 0
		for name in names:
			text = text + str(pos[i]) +". " + str(name) + "\n"
			i += 1
			if(i == 10):
				break
		label_names.set_text(text)
		text = ""
		i = 0
		for score in scores:
			i +=1
			text = text + str(score) + "\n" 
			if(i == 10):
				break
		label_scores.set_text(text)


func _on_TextureButton_pressed():
	Global.submit = false
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.

func playSound():
	var val = randi()%11+1
	sound = get_node("sounds/"+str(val))
	sound.play()

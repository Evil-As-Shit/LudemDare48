extends Node2D

onready  var label_names = get_node("NinePatchRect/names")
onready var label_scores = get_node("NinePatchRect/scores")
var names = []
var scores = []

func _ready():
	yield(SilentWolf.Scores.get_high_scores(), "sw_scores_received")
	for i in SilentWolf.Scores.scores:
		names.append(str(i["player_name"]))
		scores.append(str(i["score"]))
	print(names)
	print(scores)
	var text = ""
	for name in names:
		text = text + str(name) + "\n" 
	label_names.set_text(text)
	text = ""
	for score in scores:
		text = text + str(score) + "\n" 
	label_scores.set_text(text)
func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenes/Menu.tscn")
	pass # Replace with function body.

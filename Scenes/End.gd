extends Node2D

onready var your_score = get_node("NinePatchRect/Label")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	your_score.set_text("You Deflected " + str(Global.score) + " Distracting Thoughts!")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_TextureButton2_pressed():
	Global.player_name = get_node("LineEdit").text
	print(Global.player_name)
	SilentWolf.Scores.persist_score(Global.player_name, Global.score)
	var t = Timer.new()
	t.set_wait_time(1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	get_tree().change_scene("res://Scenes/HighScores.tscn")
	pass # Replace with function body.

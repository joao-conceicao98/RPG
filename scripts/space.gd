extends Node2D


func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action("game_quit"):
		get_node("/root/globals").setScene("res://scene/world.xml")
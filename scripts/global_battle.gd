extends Node

var player_path = "res://scene/player.xml"
var enemy_path = ""

var enemy_name = ""

func set_enemy_path(path):
	enemy_path = path
func get_enemy_path():
	return enemy_path

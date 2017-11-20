extends Node

var inimigo1_name = "inimigo1"
var inimigo1_stat = "vivo"

func get_enemy_stat(name):
	if name == "inimigo1":
		return inimigo1_stat


func set_enemy_stat(name, stat):
	if name == "inimigo1":
		inimigo1_stat = stat
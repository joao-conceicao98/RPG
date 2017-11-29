extends Node

#inimig1
var inimigo1_name = "inimigo1"
var inimigo1_stat = "vivo"
var inimigo1_life = 100
var inimigo1_ataque = 5
#inimigo1

func get_enemy_stat(name):
	if name == "inimigo1":
		return inimigo1_stat

func set_enemy_stat(name, stat):
	if name == "inimigo1":
		inimigo1_stat = stat


func get_enemy_life(name):
	if name == "inimigo1":
		return inimigo1_life

func get_enemy_ataque(name):
	if name == "inimigo1":
		return inimigo1_ataque
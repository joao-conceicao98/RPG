extends Node2D

onready var player = preload("res://scene/player.xml")
onready var inimigo1 = preload("res://scene/inimigo.xml")

#onready var enemy_name = get_node("/root/global_enemy").getEnemyName()

onready var player_pos = get_node("player_position").get_pos()
onready var enemy_pos = get_node("enemy_position").get_pos()

onready var corpos = get_node("corpos")

func _ready():
	var p = player.instance()
	add_child(p)
	p.set_pos(get_node("player_position").get_pos())
	var e = inimigo1.instance()
	add_child(e)
	e.set_pos(get_node("enemy_position").get_pos())
	
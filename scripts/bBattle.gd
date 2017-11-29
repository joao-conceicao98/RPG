extends Node2D

onready var menu = preload("res://scene/menu.tscn")
onready var world = get_node("menu")

onready var player = preload("res://scene/player.xml")
onready var inimigo1 = preload("res://scene/inimigo.xml")

#onready var enemy_name = get_node("/root/global_enemy").getEnemyName()

onready var player_pos = get_node("player_position").get_pos()
onready var enemy_pos = get_node("enemy_position").get_pos()


func _ready():
	var p = player.instance()
	add_child(p)
	p.set_pos(get_node("player_position").get_pos())
	var e = inimigo1.instance()
	add_child(e)
	e.set_pos(get_node("enemy_position").get_pos())
	
	get_node("player").set_fixed_process(false)
	
	set_process_input(true)

func _input(event):
	if event.is_action("game_quit"):
		var m = menu.instance()
		world.add_child(m)
		m.connect("menu_closed",self,"_on_menu_closed")
		m.set_global_pos(get_node("player").get_global_pos()-Vector2(70,120))
		get_node("player").set_fixed_process(false)

func _on_menu_closed():
	get_node("player").set_fixed_process(true)
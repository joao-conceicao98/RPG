extends Node2D

onready var menu = preload("res://scene/menu.tscn")
onready var world = get_node("menu")

onready var battle = preload("res://scene/Battle.tscn")

onready var inimigo1 = get_node("walls/inimigo1")

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	get_node("StreamPlayer").play()

func _fixed_process(delta):
	#inimigo1.connect("battle",self,"_on_battle")
	pass

func _input(event):
	if event.is_action("game_quit"):
		var m = menu.instance()
		world.add_child(m)
		m.connect("menu_closed",self,"_on_menu_closed")
		m.set_global_pos(get_node("walls/player").get_global_pos()-Vector2(70,120))
		get_node("walls/player").set_fixed_process(false)
		print("menu")

func _on_battle():
	var b = battle.instance()
	add_child(b)
	b.set_pos(get_node("walls/player").get_pos())
	get_node("walls/player").set_fixed_process(false)
	print("battle")

#função para quando o menu é fechado o player conseguir voltar a mexer
func _on_menu_closed():
	get_node("walls/player").set_fixed_process(true)

#Funções para teletransportar o player para outra area
#TP_to_1
func _on_TP_to_1_area_enter( area ):
	#print(area.get_name())
	if area.get_name() == "area_player":
		get_node("walls/player").set_pos(get_node("TP_to_1/TP_1").get_global_pos())
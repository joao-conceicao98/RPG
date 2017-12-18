extends Node2D


#menu:
onready var menu = preload("res://scene/menu.tscn")
onready var world = get_node("menu")


func _ready():
	
	
	
	set_process_input(true)
	set_fixed_process(true)
	
	get_node("StreamPlayer").play()

func _fixed_process(delta):
	pass

func _input(event):
	if event.is_action("game_quit"):
		var m = menu.instance()
		world.add_child(m)
		m.connect("menu_closed",self,"_on_menu_closed")
		m.set_global_pos(get_node("walls/player").get_global_pos()-Vector2(70,120))
		get_node("walls/player").set_fixed_process(false)



#função para quando o menu é fechado o player conseguir voltar a mexer
func _on_menu_closed():
	get_node("walls/player").set_fixed_process(true)



#Funções para teletransportar o player para outra area
#TP_to_1
func _on_TP_to_1_area_enter( area ):
	#print(area.get_name())
	if area.get_name() == "area_player":
		get_node("walls/player").set_pos(get_node("TP_to_1/TP_1").get_global_pos())

func _on_picos_area_enter( area ):
	if area.get_name() == "area_player":
		print("picos")


func _on_nave_area_enter( area ):
	get_node("/root/globals").setScene("res://scene/space.tscn")

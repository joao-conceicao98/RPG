	extends Node2D

#menu:
onready var menu = preload("res://scene/menu.tscn")
onready var world = get_node("menu")

func _ready():
	set_process_input(true)
	set_fixed_process(true)
	
	#get_node("StreamPlayer").play()

func _fixed_process(delta):
	null

func _input(event):
	if event.is_action("game_quit"):
		var m = menu.instance()
		world.add_child(m)
		m.connect("menu_closed",self,"_on_menu_closed")
		m.set_global_pos(get_node("player").get_global_pos()-Vector2(70,120))
		get_node("player").set_fixed_process(false)



#função para quando o menu é fechado o player conseguir voltar a mexer
func _on_menu_closed():
	get_node("player").set_fixed_process(true)


func _on_nave_area_enter( area ):
	get_node("/root/globals").setScene("res://scene/space.tscn")

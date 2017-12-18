extends Node2D

onready var menu = preload("res://scene/menu_nave.tscn")
onready var world = get_node("menu")

onready var Jupitar = get_node("Planet_Jupitar/Jupitar")
onready var BDI = get_node("Planet_BDI/BDI")

func _ready():
	set_process_input(true)
	set_process(true)

func _process(delta):
	if get_node("/root/global_enemy").get_enemy_stat("Boss_Neptanas") == "dead" :
		Jupitar.set_scale(Vector2(0,0))
	if get_node("/root/global_enemy").get_enemy_stat("Boss_Jupitar") == "dead" :
		BDI.set_scale(Vector2(0,0))

func _input(event):
	if event.is_action("game_quit"):
		var m = menu.instance()
		world.add_child(m)
		m.connect("menu_closed",self,"_on_menu_closed")
		m.set_global_pos(get_node("spaceShip").get_global_pos()-Vector2(382,583))
		get_node("spaceShip").set_fixed_process(false)

func _on_menu_closed():
	get_node("spaceShip").set_fixed_process(true)

func _on_Area2D_area_enter( area ):
	if area.get_name() == "spaceShip":
		get_node("/root/globals").setScene("res://scene/Planet_Neptanas.xml")


func _on_Planet_BDI_area_enter( area ):
	if area.get_name() == "spaceShip":
		get_node("/root/globals").setScene("res://scene/Planet_BDI.tscn")


func _on_Planet_Jupitar_area_enter( area ):
	if area.get_name() == "spaceShip":
		get_node("/root/globals").setScene("res://scene/Planet_Jupitar.tscn")


func _on_Planet_Satinico_area_enter( area ):
	if area.get_name() == "spaceShip":
		get_node("/root/globals").setScene("res://scene/Planet_Satinico.tscn")

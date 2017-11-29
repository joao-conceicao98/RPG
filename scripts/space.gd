extends Node2D

onready var menu = preload("res://scene/menu.tscn")
onready var world = get_node("menu")

func _ready():
	set_process_input(true)

func _input(event):
	if event.is_action("game_quit"):
		var m = menu.instance()
		world.add_child(m)
		m.connect("menu_closed",self,"_on_menu_closed")
		m.set_global_pos(get_node("spaceShip").get_global_pos()-Vector2(70,120))
		get_node("spaceShip").set_fixed_process(false)

func _on_menu_closed():
	get_node("spaceShip").set_fixed_process(true)

func _on_Area2D_area_enter( area ):
	if area.get_name() == "spaceShip":
		get_node("/root/globals").setScene("res://scene/world.xml")

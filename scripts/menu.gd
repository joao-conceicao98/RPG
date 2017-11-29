extends TextureFrame

signal menu_closed

var index = 0

func _ready():
	set_process(true)
	set_process_input(true)

func _process(delta):
	null

func _input(event):
	if event.is_action("ui_up") && event.is_pressed() && !event.is_echo():
		if(index != 0):
			index -= 1
			var x = get_node("Selected").get_pos().x
			var y = get_node("Selected").get_pos().y - 40
			get_node("Selected").set_pos(Vector2(x,y))
	if event.is_action("ui_down") && event.is_pressed() && !event.is_echo():
		if(index != 2):
			index += 1
			var x = get_node("Selected").get_pos().x
			var y = get_node("Selected").get_pos().y + 40
			get_node("Selected").set_pos(Vector2(x,y))
	if event.is_action("ui_accept") && event.is_pressed() && !event.is_echo():
		if (index == 0):
			#print("menu1")
			emit_signal("menu_closed")
			queue_free()
		if (index == 1):
			#print("menu2")
			emit_signal("menu_closed")
			queue_free()
		if (index == 2):
			#print("exit")
			OS.get_main_loop().quit()
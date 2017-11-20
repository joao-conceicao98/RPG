extends TextureFrame

var index = 0

func _ready():
	set_process(true)
	set_process_input(true)
	
	get_node("StreamPlayer").play()
		
	#OS.set_window_title("Just A Game Menu")

func _process(delta):
#	if(Input.is_action_pressed("ui_accept")):
#		get_node("/root/globals").setScene("res://scene/world.xml")
	null

func _input(event):
	if event.is_action("ui_up") && event.is_pressed() && !event.is_echo():
		if(index != 0):
			index -= 1
			var x = get_node("Selected").get_pos().x
			var y = get_node("Selected").get_pos().y - 80
			get_node("Selected").set_pos(Vector2(x,y))
	if event.is_action("ui_down") && event.is_pressed() && !event.is_echo():
		if(index != 3):
			index += 1
			var x = get_node("Selected").get_pos().x
			var y = get_node("Selected").get_pos().y + 80
			get_node("Selected").set_pos(Vector2(x,y))
	if event.is_action("ui_accept") && event.is_pressed() && !event.is_echo():
		if (index == 0):
			print("New Game")
			get_node("/root/globals").setScene("res://scene/world.xml")
		if (index == 1):
			print("Options")
		if (index == 2):
			print("Credits")	
		if(index == 3):
			OS.get_main_loop().quit()
extends TextureFrame


func _ready():
	set_process(true)

func _process(delta):
	if(Input.is_action_pressed("ui_accept")):
		get_node("/root/globals").setScene("res://scene/world.xml")
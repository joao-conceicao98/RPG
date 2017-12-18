extends KinematicBody2D

var p = 0

var dialog = ["nada","Olá!","Adeus!"]
var page = 0

onready var dialog_bar = get_node("dialog_bar")
onready var dialog_text = get_node("dialog_bar/RichTextLabel")

func _ready():
	set_process_input(true)

	dialog_text.set_bbcode(dialog[page])
	dialog_text.set_visible_characters(0)

func _input(event):
	if p == 1:
		if event.is_action_pressed("ui_accept"):
			print("oi")
			_dialog()


func _on_Area_NPC_area_enter( area ):
	if area.get_name() == "area_player":
		p = 1

func _on_Area_NPC_area_exit( area ):
	if area.get_name() == "area_player":
		p = 0
		dialog_bar.set_hidden(true)
		page = 0

func _dialog():
	dialog_bar.set_hidden(false)
	#dialog_text.set_bbcode(dialog[page])
	#dialog_text.set_visible_characters(0)
	if Input.is_action_pressed("ui_accept"):
		if dialog_text.get_visible_characters() > dialog_text.get_total_character_count():
			if page < dialog.size()-1:
				page +=1
				dialog_text.set_bbcode(dialog[page])
				dialog_text.set_visible_characters(0)
				
			else:
				dialog_bar.set_hidden(true)
				page = 0
		else: #faz o "skip" do resto do dialogo
			dialog_text.set_visible_characters(dialog_text.get_total_character_count())


func _on_Timer_timeout():
	dialog_text.set_visible_characters(dialog_text.get_visible_characters()+1)

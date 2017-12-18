extends KinematicBody2D

var RayNodeFinal
var RayNodeUp
var RayNodeDown
var RayNodeLeft
var RayNodeRight

var PlayerAnimNode
var anim = ""
var animNew = ""

var walk = 0
var d = 0
var speed = 100
onready var walk_timer = get_node("walk_timer")

var p = 0

var dialog = ["nada","Olá!","Adeus!"]
var page = 0

onready var dialog_bar = get_node("dialog_bar")
onready var dialog_text = get_node("dialog_bar/RichTextLabel")

func _ready():
	set_process_input(true)

	dialog_text.set_bbcode(dialog[page])
	dialog_text.set_visible_characters(0)
	
	set_fixed_process(true)
	PlayerAnimNode = get_node("AnimatedSprite")
	
	RayNodeFinal = get_node("RayNodeDown")
	RayNodeUp = get_node("RayNodeUp")
	RayNodeDown = get_node("RayNodeDown")
	RayNodeLeft = get_node("RayNodeLeft")
	RayNodeRight = get_node("RayNodeRight")


func _input(event):
	if p == 1:
		if event.is_action_pressed("ui_accept"):
			#print("oi")
			_dialog()


func _dialog():
	var dialog_pos = get_node("/root/global_player").getDialogPos()
	dialog_bar.set_global_pos(dialog_pos)
	dialog_bar.set_hidden(false)
	walk_timer.stop()
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
				walk_timer.start()
		else: #faz o "skip" do resto do dialogo
			dialog_text.set_visible_characters(dialog_text.get_total_character_count())


func _on_Timer_timeout():
	dialog_text.set_visible_characters(dialog_text.get_visible_characters()+1)
	


func _on_Area_NPC1_1_Neptanas_area_enter( area ):
	if area.get_name() == "area_player":
		p = 1


func _on_Area_NPC1_1_Neptanas_area_exit( area ):
	if area.get_name() == "area_player":
		p = 0
		dialog_bar.set_hidden(true)
		page = 0
		walk_timer.start()


func _on_walk_timer_timeout():
	walk = rand_range(0,100)
	walk = int(walk)
	d = rand_range(0,3)
	d = int(d)
	
	
func _fixed_process(delta):
	
	#ai
	var Move = Vector2()
	if walk > 0 :
		walk = walk -1
		if d == 0:
			Move += Vector2(0,1)
			RayNodeFinal = RayNodeDown
			anim = "Walk_D"
		if d == 1:
			Move += Vector2(-1,0)
			RayNodeFinal = RayNodeLeft
			anim = "Walk_L"
		if d == 2:
			Move += Vector2(1,0)
			RayNodeFinal = RayNodeRight
			anim = "Walk_R"
		if d == 3:
			Move += Vector2(0,-1)
			RayNodeFinal = RayNodeUp
			anim = "Walk_U"
		else:
			if (RayNodeFinal == RayNodeUp):
				anim = "Idle_U"
			if (RayNodeFinal == RayNodeDown):
				anim = "Idle_D"
			if (RayNodeFinal == RayNodeLeft):
				anim = "Idle_L"
			if (RayNodeFinal == RayNodeRight):
				anim = "Idle_R"

	if anim != animNew:
		animNew = anim
		PlayerAnimNode.play(anim)
	
	Move = Move.normalized() * speed * delta
	Move = move(Move)
	

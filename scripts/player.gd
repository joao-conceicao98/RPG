extends KinematicBody2D

export var life = 100
onready var progressBar = get_node("GUI/ProgressBar")

export var MOTION_SPEED = 140
const IDLE_SPEED = 10

onready var ataque1 = preload("res://scene/player_ataque.tscn")
onready var ataques = get_node("ataques")

onready var ataque1_timer = get_node("ataque1_timer")

onready var lvlStat = get_node("GUI/lvlStat")


var RayNodeFinal
var RayNodeUp
var RayNodeDown
var RayNodeLeft
var RayNodeRight


var PlayerAnimNode
var anim = ""
var animNew = ""

onready var dialog = get_node("dialog")

func _ready():
	set_fixed_process(true)
	
	RayNodeFinal = get_node("RayNodeDown")
	RayNodeUp = get_node("RayNodeUp")
	RayNodeDown = get_node("RayNodeDown")
	RayNodeLeft = get_node("RayNodeLeft")
	RayNodeRight = get_node("RayNodeRight")
	
	
	PlayerAnimNode = get_node("AnimatedSprite")


func _fixed_process(delta):
	
	var dialogPos = dialog.get_global_pos()
	get_node("/root/global_player").setDialogPos(dialogPos)
	
	var motion = Vector2()
	
	if (Input.is_action_pressed("ataque1")):
		if (ataque1_timer.get_time_left() == 0):
			ataque_1()
	
	#motion
	
	if (Input.is_action_pressed("sprint")):
		MOTION_SPEED = 300
	else:
		MOTION_SPEED = 140
	
	if (Input.is_action_pressed("ui_up")):
		motion +=  Vector2(0,-1)
		RayNodeFinal = RayNodeUp
		#RayNode.set_rotd(180)
	
	if (Input.is_action_pressed("ui_down")):
		motion +=  Vector2(0,1)
		RayNodeFinal = RayNodeDown
		#RayNode.set_rotd(0)
	
	if (Input.is_action_pressed("ui_left")):
		motion +=  Vector2(-1,0)
		RayNodeFinal = RayNodeLeft
		#RayNode.set_rotd(-90)
	
	if (Input.is_action_pressed("ui_right")):
		motion +=  Vector2(1,0)
		RayNodeFinal = RayNodeRight
		#RayNode.set_rotd(90)
	
	motion = motion.normalized()*MOTION_SPEED*delta
	move(motion)
	
	#Animations
	
	
	if (motion.length() > IDLE_SPEED*0.09):
		if (Input.is_action_pressed("ui_up")):
			anim = "Walk_U"
		if (Input.is_action_pressed("ui_down")):
			anim = "Walk_D"
		if (Input.is_action_pressed("ui_right")):
			anim = "Walk_R"
		if (Input.is_action_pressed("ui_left")):
			anim = "Walk_L"
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
		
	
	#life
	progressBar.set_value(life)
	
	#lvl
	var lvl = get_node("/root/global_player").getPlayerlvl()
	lvlStat.set_bbcode(str(lvl))

func ataque_1():
	ataque1_timer.start()
	var a1 = ataque1.instance()
	ataques.add_child(a1)
	a1.start_at(RayNodeFinal.get_rot(), get_global_pos())
	#get_node("/root/global_player").setPlayerAtaque(20)

func _on_ProgressBar_value_changed( value ):
	pass # replace with function body


func _on_area_player_area_enter( area ):
	if area.get_name() == "picos":
		life = life - 5
	if area.get_name() == "enemy_Neptanas_ataque":
		var dmg = get_node("/root/global_enemy").get_enemy_ataque("Enemy_Neptanas")
		#get_node("/root/global_player").setPlayerLife(dmg)
		life = life - dmg
	if area.get_name() == "Boss_Neptanas_ataque":
		var dmg = get_node("/root/global_enemy").get_enemy_ataque("Boss_Neptanas")
		#get_node("/root/global_player").setPlayerLife(dmg)
		life = life - dmg

func _on_Life_refresh_timeout():
	life += get_node("/root/global_player").getPlayerLifeRefresh()
	if life > 100 :
		life = 100

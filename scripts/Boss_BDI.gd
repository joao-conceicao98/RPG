extends KinematicBody2D

var life = 200
onready var progressBar = get_node("ProgressBar")
var speed = 100

onready var ataque = preload("res://scene/Boss_BDI_ataque.tscn")
onready var ataques = get_node("ataques")

onready var ataque_timer = get_node("ataque_timer")

var RayNodeFinal
var RayNodeUp
var RayNodeDown
var RayNodeLeft
var RayNodeRight

var PlayerAnimNode
var anim = ""
var animNew = ""

func _ready():
	set_fixed_process(true)
	PlayerAnimNode = get_node("AnimatedSprite")
	
	RayNodeFinal = get_node("RayNodeDown")
	RayNodeUp = get_node("RayNodeUp")
	RayNodeDown = get_node("RayNodeDown")
	RayNodeLeft = get_node("RayNodeLeft")
	RayNodeRight = get_node("RayNodeRight")

func _fixed_process(delta):
	
	progressBar.set_value(life)
	
	#ai
	var Move = Vector2()
	var body = get_node("Area_Boss_BDI").get_overlapping_bodies()
	
	if body.size() != 0 :
		for tinge in body:
			if tinge.is_in_group("player"):
				
				
				if tinge.get_global_pos().y > self.get_global_pos().y:
					Move += Vector2(0,1)
					RayNodeFinal = RayNodeDown
					#anim = "Walk_D"
				if tinge.get_global_pos().x < self.get_global_pos().x:
					Move += Vector2(-1,0)
					RayNodeFinal = RayNodeLeft
					#anim = "Walk_L"
				if tinge.get_global_pos().x > self.get_global_pos().x:
					Move += Vector2(1,0)
					RayNodeFinal = RayNodeRight
					#anim = "Walk_R"
				if tinge.get_global_pos().y < self.get_global_pos().y:
					Move += Vector2(0,-1)
					RayNodeFinal = RayNodeUp
					#anim = "Walk_U"


			else:
				if (RayNodeFinal == RayNodeUp):
					anim = "Idle_U"
				if (RayNodeFinal == RayNodeDown):
					anim = "Idle_D"
				if (RayNodeFinal == RayNodeLeft):
					anim = "Idle_L"
				if (RayNodeFinal == RayNodeRight):
					anim = "Idle_R"
					
					
				if (ataque_timer.get_time_left() == 0):
					ataque()
	if anim != animNew:
		animNew = anim
		PlayerAnimNode.play(anim)
	
	Move = Move.normalized() * speed * delta
	Move = move(Move)




func _on_Body_area_enter( area ):
	if area.get_name() == "player_ataque":
		#print(area.get_name())
		var dmg = get_node("/root/global_player").getPlayerAtaque()
		life = life - dmg
		if (life <= 0):
			get_node("/root/global_enemy").set_enemy_stat("Boss_BDI","dead")
			get_node("/root/global_player").setPlayerxp(50)
			queue_free()

func ataque():
	ataque_timer.start()
	var a1 = ataque.instance()
	ataques.add_child(a1)
	a1.start_at(RayNodeFinal.get_rot(), get_global_pos())


func _on_ataque_timer_timeout():
	var body = get_node("Area_Boss_BDI").get_overlapping_bodies()
	
	if body.size() != 0 :
		for tinge in body:
			if tinge.is_in_group("player"):
				ataque()


func _on_ProgressBar_changed():
	pass # replace with function body

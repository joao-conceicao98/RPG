extends KinematicBody2D

onready var ataque1 = preload("res://scene/ataque1.tscn")
onready var ataques = get_node("ataques")

onready var ataque1_timer = get_node("ataque1_timer")

onready var progressBar = get_node("Area2D/ProgressBar")

#var dmg = 0
var life = 0

func _ready():
	set_fixed_process(true)
	life = get_node("/root/global_enemy").getEnemyLife()


func _fixed_process(delta):
	if (ataque1_timer.get_time_left() == 0):
		ataque_1()
		get_node("/root/global_enemy").setEnemyAtaque(0)

func _on_Area2D_area_enter( area ):
	var dmg = get_node("/root/global_player").getPlayerAtaque()
	life = life - dmg
	#var progressBar = get_node("Area2D/ProgressBar")
	progressBar.set_value(life)
	if (life <= 0):
		queue_free()

func ataque_1():
	ataque1_timer.start()
	var a1 = ataque1.instance()
	ataques.add_child(a1)
	a1.start_at(get_node("Right").get_rot(), get_pos())
	get_node("/root/global_enemy").setEnemyAtaque(20)
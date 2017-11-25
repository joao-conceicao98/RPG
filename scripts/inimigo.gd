extends KinematicBody2D

onready var ataques = get_node("ataques")
onready var ataque1_timer = get_node("ataque1_timer")

onready var progressBar = get_node("Area2D/ProgressBar")

var self_path = "res://scene/inimigo.xml"

var life = 0

func _ready():
	set_fixed_process(true)
	life = get_node("/root/global_enemy").getEnemyLife()

func _fixed_process(delta):
	pass

func _on_Area2D_area_enter( area ):
	#print(area.get_name())
	if area.get_name() == "ataque1":
		print(area.get_name())
		var dmg = get_node("/root/global_player").getPlayerAtaque()
		life = life - dmg
		progressBar.set_value(life)
		if (life <= 0):
			queue_free()
	if area.get_name() == "area_player":
		print("combate")
		get_node("/root/global_enemy").setEnemyName("inimigo1")
		get_node("/root/global_battle").set_enemy_path(self_path) #prepara o path do inimigo para a batalha
		emit_signal("battle")
		#print(get_node("/root/global_battle").get_enemy_path())


func _on_ProgressBar_changed():
	pass

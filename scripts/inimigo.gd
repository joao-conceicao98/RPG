extends KinematicBody2D

onready var ataques = get_node("ataques")
onready var ataque1_timer = get_node("ataque1_timer")

onready var progressBar = get_node("Area2D/ProgressBar")

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
		emit_signal("combate")


func _on_ProgressBar_changed():
	pass

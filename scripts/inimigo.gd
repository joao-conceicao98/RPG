extends KinematicBody2D

#var dmg = 0
var life = 0
onready var popup = get_node("PopupDialog")

func _ready():
	life = get_node("/root/global_enemy").getEnemyLife()

func _on_Area2D_area_enter( area ):
	var dmg = get_node("/root/global_player").getPlayerAtaque()
	life = life - dmg
	var progressBar = get_node("Area2D/ProgressBar")
	progressBar.set_value(life)
	if (life <= 0):
		queue_free()

func _on_ProgressBar_value_changed( value ):
	pass # replace with function body

extends KinematicBody2D

export var MOTION_SPEED = 140
const IDLE_SPEED = 10

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	#motion
	var motion = Vector2()
	
	if (Input.is_action_pressed("sprint")):
		MOTION_SPEED = 300
	else:
		MOTION_SPEED = 140
	
	if (Input.is_action_pressed("ui_up")):
		motion +=  Vector2(0,-1)
	
	if (Input.is_action_pressed("ui_down")):
		motion +=  Vector2(0,1)
	
	if (Input.is_action_pressed("ui_left")):
		motion +=  Vector2(-1,0)
	
	if (Input.is_action_pressed("ui_right")):
		motion +=  Vector2(1,0)
	
	motion = motion.normalized()*MOTION_SPEED*delta
	move(motion)
extends Node


var correntScene = null





func _ready():
	correntScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)

func setScene(scene):
	correntScene.queue_free()
	var s = ResourceLoader.load(scene)
	correntScene = s.instance()
	get_tree().get_root().add_child(correntScene)
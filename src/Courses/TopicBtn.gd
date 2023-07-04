extends Button

export var topic_path = ""

var original_scale = Vector2(1, 1)
var grow_size = Vector2(1.05, 1.05)

func _ready():
	original_scale = rect_scale
	
func _on_TopicBtn_mouse_entered(): 
	rect_scale = original_scale * grow_size

func _on_TopicBtn_mouse_exited():
	rect_scale = original_scale

func _on_TopicBtn_pressed():
	if topic_path == "":
		return
	get_tree().change_scene(topic_path)

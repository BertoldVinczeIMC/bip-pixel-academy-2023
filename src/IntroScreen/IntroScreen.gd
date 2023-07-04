extends Node

var timer = null

func _ready():
	start_timer()

func start_timer():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 3.0
	timer.connect("timeout", self, "_onTimerTimeout")
	timer.start()

func _onTimerTimeout():
	get_tree().change_scene("res://CourseSelection/CourseSelectScreen.tscn")

func _input(event):
	if Input.is_key_pressed(KEY_ENTER) || Input.is_mouse_button_pressed(BUTTON_LEFT):
		if timer != null:
			timer.queue_free()
		get_tree().change_scene("res://CourseSelection/CourseSelectScreen.tscn")

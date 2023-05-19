extends Control

var is_paused = false setget set_is_paused

func _on_ResumeBtn_pressed():
	self.is_paused = false

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _input(event):
	if Input.is_key_pressed(KEY_ESCAPE):
		self.is_paused = !is_paused
		get_tree().set_input_as_handled()

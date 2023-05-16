extends Control

onready var description = $MarginContainer/VBoxContainer/ColorRect/Description
var declaration = "Select a topic to get a description of the content."

func _ready():
	description.text = declaration

func _on_Topic1_mouse_entered():
	description.text = "Topic1 Description"

func _on_Topic2_mouse_entered():
	description.text = "Topic2 Description"

func _on_Topic3_mouse_entered():
	description.text = "Topic3 Description"

func _on_Topic4_mouse_entered():
	description.text = "Topic4 Description"

func _on_Topic5_mouse_entered():
	description.text = "Topic5 Description"

func _on_Topic6_mouse_entered():
	description.text = "Topic6 Description"

func _on_Topic1_mouse_exited():
	description.text = declaration

func _on_Topic2_mouse_exited():
	description.text = declaration

func _on_Topic3_mouse_exited():
	description.text = declaration

func _on_Topic4_mouse_exited():
	description.text = declaration

func _on_Topic5_mouse_exited():
	description.text = declaration

func _on_Topic6_mouse_exited():
	description.text = declaration

func _on_Back_pressed():
	get_tree().change_scene("res://CourseSelection/CourseSelectScreen.tscn")

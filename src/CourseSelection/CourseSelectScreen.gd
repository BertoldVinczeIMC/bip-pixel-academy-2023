extends Control

onready var description = $MarginContainer/VBoxContainer/ColorRect/Description
var declaration = "Select a course to get a description of the content."

func _ready():
	description.text = declaration

func _on_Python_mouse_entered():
	description.text = "In this Python course, you will learn the basics of the Python programming language, including syntax, variables, conditions, loops, and functions."
	
func _on_Python_mouse_exited():
	description.text = declaration

func _on_Placeholder_mouse_entered():
	description.text = "Placeholder Course Description"

func _on_Placeholder_mouse_exited():
	description.text = declaration


func _on_Python_pressed():
	pass # Replace with function body.

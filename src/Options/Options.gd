extends MarginContainer

onready var selector_two = $ColorRect/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selector_three = $ColorRect/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector

var current_selection = 1

func _ready():
	set_current_selection(1)
	var my_setting_value = ProjectSettings.get_setting("music")
	print("The value of my_setting is:", my_setting_value)
	
func _process(delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 1:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)
		
func handle_selection(_current_selection):
	if _current_selection == 0:
		print("No sound")
	elif _current_selection == 1:
		get_tree().change_scene("res://MainMenu/MainMenu.tscn")
		queue_free()
	elif _current_selection == 2:
		get_tree().quit()

func set_current_selection(_current_selection):
	selector_two.text = ""
	selector_three.text = ""
	if _current_selection == 1:
		selector_two.text = ">"
	elif _current_selection == 2:
		selector_three.text = ">"


func _on_CheckButton_toggled(button_pressed):
	print("Music button toggled")
	ProjectSettings.set_setting("music", button_pressed)
	var my_setting_value = ProjectSettings.get_setting("music")
	print("The value of my_setting is:", my_setting_value)
	$ColorRect/CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/CheckButton.release_focus()

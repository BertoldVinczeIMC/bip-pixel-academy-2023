extends CanvasLayer

func _on_PauseMenu_menu():
	get_parent().get_tree().change_scene("res://CourseSelection/CourseSelectScreen.tscn")

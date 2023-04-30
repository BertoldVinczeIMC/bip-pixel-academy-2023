extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# Wait for 5 seconds
	yield(get_tree().create_timer(3.0), "timeout")

	# Do something after 5 seconds
	print("5 seconds have passed")
	get_tree().change_scene("res://MainMenu/MainMenu.tscn")
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


	

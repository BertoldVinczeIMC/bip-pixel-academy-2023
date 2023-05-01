extends CheckBox


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("is_pressed", self, "_on_changed")
	pass
	
func _toggled(value):
	print("Muted:",value)
	AudioServer.set_bus_mute(0, value )
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

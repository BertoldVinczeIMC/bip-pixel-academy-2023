extends HSlider


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var muteButton = $Checkbox



# Called when the node enters the scene tree for the first time.
func _ready():
	self.connect("value_changed", self, "_on_changed")

func _on_changed(value):
	print("New volume:",value)
	AudioServer.set_bus_volume_db(0, value)
	AudioServer.set_bus_mute(0, value == 0)
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

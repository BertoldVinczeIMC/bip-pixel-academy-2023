extends Control

var is_paused = false setget set_is_paused
var music_bus = AudioServer.get_bus_index("Music")
var sound_effects_bus = AudioServer.get_bus_index("Sound Effects")
onready var music_button = $CenterContainer/VBoxContainer/MusicBtn
onready var sound_button = $CenterContainer/VBoxContainer/SoundBtn

signal menu

func _ready():
	music_button.set_pressed_no_signal(!AudioServer.is_bus_mute(music_bus))
	sound_button.set_pressed_no_signal(!AudioServer.is_bus_mute(sound_effects_bus))

func _unhandled_input(_event):
	if Input.is_key_pressed(KEY_ESCAPE):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused

func _on_ResumeBtn_pressed():
	self.is_paused = false

func _on_MenuBtn_pressed():
	self.is_paused = false
	emit_signal("menu")
	
func _on_QuitBtn_pressed():
	get_tree().quit()

func _on_MusicBtn_toggled(_button_pressed):
	AudioServer.set_bus_mute(music_bus, not AudioServer.is_bus_mute(music_bus))

func _on_SoundBtn_toggled(_button_pressed):
	AudioServer.set_bus_mute(sound_effects_bus, not AudioServer.is_bus_mute(sound_effects_bus))


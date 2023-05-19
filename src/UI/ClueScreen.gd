extends CanvasLayer

var clue1 = "clue1"
var clue2 = "clue2"
var clue3 = "clue3"
var clue4 = "clue4"
var clue5 = "clue5"
var clue6 = "clue6"
var clue7 = "clue7"
var clue8 = "clue8"
var clue9 = "clue9"
var clue10 = "clue10"

var clues = [clue1, clue2, clue3, clue4, clue5, clue6, clue7, clue8, clue9, clue10]

func _ready():
	clues.shuffle()

func _on_Level1_clue():
	if clues.size() > 0:
		$ClueScreen.set_is_paused(true)
		$ClueScreen/CenterContainer/VBoxContainer/ClueText.text = clues[0]
		clues.remove(0)

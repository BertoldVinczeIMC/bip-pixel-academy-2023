extends CanvasLayer

var clue1 = "Unleash the power of mathematical transformations! To find the elusive square root, embrace the function that starts with 's' and ends with 't'. Its name hints at the magic it holds, unlocking the mystery of numbers and their hidden roots."
var clue2 = "Empower variables with casting. Shape their type to your will. Customize data, speak in different tongues."
var clue3 = "Unlock the secrets of variable types! When in doubt, consult the type() function. It unveils the mysterious nature of data, revealing the essence within."
var clue4 = "Embark on the journey of conditionals! Control the flow of your program, dancing between true and false. Let decisions shape your destiny."
var clue5 = "Dive into the realm of loops! Repeat actions like an eternal echo. Traverse the realms of data, exploring each element in its domain."
var clue6 = "Unleash the power of functions! Define your own magic spells. Wrap code in a sacred incantation, and watch as miracles unfold."
var clue7 = "Discover the art of string manipulation! Weave words into a tapestry of meaning. Slice, concatenate, and transform letters into poetry."
var clue8 = "Harness the might of lists! Create ordered collections of knowledge. Append, remove, and traverse the vast ocean of data."
var clue9 = "Venture into the land of dictionaries! Forge key-value pairs into a treasure trove of information. Access, update, and conquer the realm of associations."
var clue10 = "Unlock the secret language of modules! Tap into the collective wisdom of code. Import, explore, and expand your powers through the magic of external libraries."

var clues = [clue1, clue2, clue3, clue4, clue5, clue6, clue7, clue8, clue9, clue10]

func _ready():
	randomize()
	clues.shuffle()

func _on_clue():
	if clues.size() > 0:
		$ClueScreen.set_is_paused(true)
		$ClueScreen/CenterContainer/VBoxContainer/ClueText.text = clues[0]
		clues.remove(0)

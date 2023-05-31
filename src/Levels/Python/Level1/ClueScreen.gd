extends CanvasLayer

var clue1 = "Welcome to the realm of Python, where code finds its balance. Crack the secret to success with precise spacing. Align your lines carefully, using four spaces as your guide."
var clue2 = "Unleash the power of variables, give them life! By assigning a value, turn the unknown into a known. Watch as simple actions transform the void into meaningful names."
var clue3 = "Reveal Python's hidden secrets. Annotate with subtlety, using a simple # symbol"
var clue4 = "Attention, aspiring Pythonista! Remember, code is like a dance party. Make sure your parentheses are matched, or the DJ might stop the beat!"
var clue5 = "Psst! Python secret alert! To unlock the door of success, befriend the mighty 'if' and 'else.' They hold the key to making decisions in your code kingdom."
var clue6 = "Hold your breath, brave coder! The treasure lies within loops. Embrace the power of 'for' and 'while' to navigate through the labyrinth of programming challenges."
var clue7 = "Oh dear, it seems you've stumbled upon a furious 'SyntaxError' dragon! Calm it down by paying tribute to the sacred colon ':' and the art of indentation. It loves neatly aligned code feasts!"
var clue8 = "Listen up, Python adventurer! Strings are more than just words. They can be manipulated like clay in the hands of a mischievous artist. Explore their magical powers of slicing and concatenation!"
var clue9 = "Ahoy, matey! Prepare for the high seas of coding with lists. They're like a pirate's treasure chest, holding a trove of data. Don't forget to plunder their contents using indexing and slicing!"
var clue10 = "Brace yourself, coding genius! Functions are your trusty sidekicks, ready to perform your bidding. Give them a name and command them wisely. Together, you'll conquer the Python realm!"

var clues = [clue1, clue2, clue3, clue4, clue5, clue6, clue7, clue8, clue9, clue10]

func _ready():
	randomize()
	clues.shuffle()

func _on_clue():
	if clues.size() > 0:
		$ClueScreen.set_is_paused(true)
		$ClueScreen/CenterContainer/VBoxContainer/ClueText.text = clues[0]
		clues.remove(0)

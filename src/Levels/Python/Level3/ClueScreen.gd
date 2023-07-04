extends CanvasLayer

var clue1 = "Unlock the language of calculation in Python. Numeric values are your tools, and arithmetic operators your guide. Add, subtract, multiply, and divide with precision. Let math shape your code's destiny."
var clue2 = "Empower variables with values, the essence of assignment. Unleash the might of assignment operators, granting purpose. Breathe life into variables, bestowing the gift of value."
var clue3 = "Merge the forces of conditionals in Python's realm. Unleash the power of logical operators, the glue of truth. Combine statements, weaving the fabric of logic. Embrace the art of connection, where conditions unite."
var clue4 = "Uncover the truth of object identity within Python's domain. Seek beyond equality, diving into the depths of true sameness. Invoke the power of identity operators, probing the shared memory. Unite with certainty, where objects reveal their intimate bond."
var clue5 = "Seek hidden connections within Python's realm. Unleash membership operators, revealing sequence presence. Embrace the quest for belonging, where objects share secrets."
var clue6 = "Decode the language of bits. Embrace bitwise operators, where binary numbers align. Unveil their secrets, comparing with precision. Embrace the power of binary connection."
var clue7 = "Unleash the power of functions in Python's realm. Embrace the art of modularization, where code finds structure. Define your own functions, encapsulating logic. Let them be your allies in the quest for code organization and reusability."
var clue8 = "Unravel the mysteries of data manipulation in Python. Embrace the power of string methods, where characters dance to your commands. Slice, concatenate, and transform strings, molding them to your will. Let strings reveal their hidden treasures."
var clue9 = "Unlock the gateways to external worlds in Python. Harness the might of modules and libraries, extending the reach of your code. Import external resources, expanding the possibilities. Embrace the power of collaboration and reuse."
var clue10 =  "Delve into the art of error handling in Python's realm. Embrace the power of exception handling, where errors meet their match. Catch and handle exceptions, ensuring graceful code execution. Master the balance between resilience and flow."

var clues = [clue1, clue2, clue3, clue4, clue5, clue6, clue7, clue8, clue9, clue10]

func _ready():
	randomize()
	clues.shuffle()

func _on_clue():
	if clues.size() > 0:
		$ClueScreen.set_is_paused(true)
		$ClueScreen/CenterContainer/VBoxContainer/ClueText.text = clues[0]
		clues.remove(0)

extends Control

var question1 = [
	"When using Python what's the correct amount of spaces for indentation?\n\n1: 2\n2: 4\n3: Does not matter",
	2
]
var question2 = [
	"How do you create a new variable in Python?\n\n1: By declaring with data types\n2: By just assigning a value to the variable\n3: By first creating a constructor with setters and getters",
	2
]
var question3 = [
	"How does one comment out a line in Python?\n\n1: Using <!--...-->\n2: Using //\n3: Using #",
	3
]

var questions = [question1, question2, question3]

func _ready():
	randomize()
	questions.shuffle()
	$Question1/Label.text = "Question 1/3:\n" + questions[0][0]
	$Question2/Label.text = "Question 2/3:\n" + questions[1][0]
	$Question3/Label.text = "Question 3/3:\n" + questions[2][0]

	get_parent().set_right_pipe(1, questions[0][1])
	get_parent().set_right_pipe(2, questions[1][1])
	get_parent().set_right_pipe(3, questions[2][1])

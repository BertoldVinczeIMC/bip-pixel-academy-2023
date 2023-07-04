extends Control

var question1 = [
	"Which function is used in Python to calculate the square root of a number?\n\n1: sqrt()\n2: pow()\n3: abs()",
	1
]
var question2 = [
	"In Python what do we use for type conversion?\n\n1: Casting\n2: Data transformation function\n3: Typecast method",
	1
]
var question3 = [
	"What could you use to find out what data type a variable has?\n\n1: getTypeOf method\n2: type() function\n3: None of the above because this is not possible",
	2
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

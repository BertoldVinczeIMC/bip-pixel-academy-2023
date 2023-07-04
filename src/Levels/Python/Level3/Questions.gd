extends Control

var question1 = [
	"What are Arithmetic Operators used for?\n\n1: For performing common mathematical operations\n2: For changing the data type of variables\n3: For getting the data type of a specific variable",
	1
]
var question2 = [
	"What are Assignment operators used for?\n\n1: For performing common mathematical operations\n2: For assigning values to variables\n3: For replacing data types from variables",
	2
]
var question3 = [
	"What are Logical Operators used for?\n\n1: For combining conditional statements\n2: For assigning values to variables\n3: For performing mathematical calculations",
	1
]
var question4 = [
	"What are Identity Operators used for?\n\n1: Checking equality between objects\n2: Comparing values of variables\n3: Determining if objects are the same instance",
	3
]
var question5 = [
	"What are Membership Operators used for? \n\n1: Checking if a value is equal to another value\n2: Testing the presence of a sequence in an object\n3: Comparing the sizes of two objects",
	2
]
var question6 = [
	"What are Bitwise Operators used for? \n\n1: Comparing binary numbers\n2: Performing mathematical calculations\n3: Checking equality between values",
	1
]

var questions = [question1, question2, question3, question4, question5, question6]

func _ready():
	randomize()
	questions.shuffle()
	$Question1/Label.text = "Question 1/3:\n" + questions[0][0]
	$Question2/Label.text = "Question 2/3:\n" + questions[1][0]
	$Question3/Label.text = "Question 3/3:\n" + questions[2][0]

	get_parent().set_right_pipe(1, questions[0][1])
	get_parent().set_right_pipe(2, questions[1][1])
	get_parent().set_right_pipe(3, questions[2][1])

extends Resource
class_name Dice

#vars to be exported in inheriter script
var dice : String

#local to script variables
var rng : RandomNumberGenerator
var dice_min : int = 1
var dice_max : int

#vars needed in inheriter script 
#@export var sprite : AnimatedSprite2D
	#the sprite of the dice
#@export var dice_label : Label
	#the dice number displayed on top of sprite
#@export var num_of_dice_input : LineEdit
	#will be used to get the typed number to choose how many dice to roll with .text
#@export var rollbutton : Button
	#connect to button
#var num_of_dice : int
	#var num_of_dice = int(num_of_dice_input.text) 
	#to be the arg for _roll_multiple_of_dice  
#var dice_result_array :Array
	#var dice_result_array = _roll_multiple_of_dice(num_of_dice) 
	#_roll_multiple_of_dice() returns an array which will be saved as this var to be put in _sum_of_rolls

#rolls a dice based on what dice type is declared in inheriter script
func _roll_dice(_dice) -> int:
	rng = RandomNumberGenerator.new()
	rng.randomize()
	if _dice == "d4":
		dice_max = 4
	elif _dice == "d6":
		dice_max = 6
	elif _dice == "d8":
		dice_max = 8
	elif _dice == "d10":
		dice_max = 10
	elif _dice == "d12":
		dice_max = 12
	elif _dice == "d20":
		dice_max = 20
	else:
		print("No dice selected")
	var result = rng.randi_range(dice_min, dice_max)
	print(_dice + " has been initiated")
	print("_roll_dice() result is " + str(result))
	return result

#calls _roll_dice() a number of times based on the arg
func _roll_multiple_of_dice(_num_of_dice) -> Array:
	var results = []
	for i in range(_num_of_dice):
		results.append(_roll_dice(dice))
	print("_roll_multiple_of_dice() result is " + str(results))
	return results

#used to take the output array from _roll_multiple_of_dice() and total the numbers
func _sum_of_rolls(array) -> int:
	var sum : int = 0
	for i in range(array.size()):
		sum += array[i]
	print("_sum_of_rolls() result is " + str(sum))
	return sum

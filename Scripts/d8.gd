extends MarginContainer

var dice_class = preload("res://Scripts/dice.gd")
@export var sprite : AnimatedSprite2D
@export var dice_label : Label
@export var num_of_dice_input : LineEdit
@export var rollbutton : Button 
@export var dice : String
var die = dice_class.new()

var num_of_dice : int = 1
var dice_result_array : Array

func _init():
	die = dice_class.new()

func _on_roll_button_pressed():
	die.dice = dice
	if int(num_of_dice_input.text) < 1:
		num_of_dice = 1
	else:
		num_of_dice = int(num_of_dice_input.text)
	dice_result_array = die._roll_multiple_of_dice(num_of_dice)
	var total = die._sum_of_rolls(dice_result_array)
	dice_label.text = str(total)

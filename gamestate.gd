extends Node

var coins := 0
var total_coins := 0
var level_complete := false
var valid := false

func reset() -> void:
	coins = 0
	level_complete = false

func all_coins_collected() -> bool:
	valid = total_coins > 0 and coins >= total_coins
	return valid

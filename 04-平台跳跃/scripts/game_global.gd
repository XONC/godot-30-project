extends Node

var coin:int = 0

func set_coin(val = 1) -> void:
	coin += val

func get_coin() -> int:
	return coin

func clear_coin() -> void:
	coin = 0

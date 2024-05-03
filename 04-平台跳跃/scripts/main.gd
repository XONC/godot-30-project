extends Node2D

@onready var label: Label = $Label


func _physics_process(delta: float) -> void:
	label.text = "获取的银币数" + str(GameGlobal.get_coin()) + "个"

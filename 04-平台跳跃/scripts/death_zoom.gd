extends Area2D


@onready var timer: Timer = $Timer

var player = null

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Player":
		Engine.time_scale = 0.5
		timer.start()
		body.get_node("CollisionShape2D").queue_free()
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	GameGlobal.clear_coin()
	get_tree().reload_current_scene()
	pass # Replace with function body.

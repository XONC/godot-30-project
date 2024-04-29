extends Node2D

@onready var path_follow_2d: PathFollow2D = $Player/Path2D/PathFollow2D
@onready var mob_container: Node2D = $MobContainer
@onready var game_over_layer: ColorRect = $GameOverLayer/ColorRect

func _ready() -> void:
	pass

func spwan_mob() -> void:
	var mob = preload("res://scences/mob.tscn").instantiate() as CharacterBody2D
	path_follow_2d.progress_ratio = randf()
	mob.global_position = path_follow_2d.global_position
	mob_container.add_child(mob)
	
	pass

func _on_player_health_depleted() -> void:
	game_over_layer.visible = true
	get_tree().paused = true
	pass # Replace with function body.


func _on_mob_generate_timer_timeout() -> void:
	spwan_mob()
	pass # Replace with function body.

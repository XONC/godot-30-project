extends Area2D

@onready var player: CharacterBody2D = get_parent()
@onready var buttet_container: Marker2D = %ButtetContainer
@onready var shoot_timer: Timer = $ShootTimer


var current_mob: CharacterBody2D = null
var can_shoot: bool = true


func _physics_process(delta: float) -> void:
	var enemies = get_overlapping_bodies()
	if enemies.size() > 0:
		current_mob = enemies.front() as CharacterBody2D
		look_at(current_mob.global_position)
		if can_shoot:
			can_shoot = false
			shoot_timer.start()
	pass


func _on_timer_timeout() -> void:
	can_shoot = true
	var buttet = preload("res://scences/buttet.tscn").instantiate() as Area2D
	buttet.global_position = buttet_container.global_position
	buttet.global_rotation = buttet_container.global_rotation
	buttet_container.add_child(buttet)
	pass

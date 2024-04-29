extends CharacterBody2D

signal health_depleted

var speed: float = 500.0
var health: float = 100.0

@onready var happy_boo: Node2D = $HappyBoo
@onready var hurt_area: Area2D = $HurtArea
@onready var progress_bar: ProgressBar = $ProgressBar


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	
	velocity = direction * speed
	
	if Vector2.ZERO == velocity:
		happy_boo.play_idle_animation()
	else:
		happy_boo.play_walk_animation()
		
	move_and_slide()
	
	var demage: float = 5
	var bodies = hurt_area.get_overlapping_bodies()
	if bodies.size():
		health -= demage * bodies.size() * delta
		if health < 0:
			health_depleted.emit()
		
	progress_bar.value = health	
	

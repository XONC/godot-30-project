extends CharacterBody2D

var default_speed:float = 100.0
var health:int = 5

@onready var slime: Node2D = $Slime
@onready var player:CharacterBody2D = get_node("/root/Main/Player")
var speed:float = 0.0

func _ready() -> void:
	speed = default_speed
	slime.play_walk()
	pass

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	
	move_and_slide()
	pass

func take_health() -> void:
	health -= 1
	slime.play_hurt()
	if health <= 0:
		queue_free()
		var smoke = preload("res://smoke_explosion/smoke_explosion.tscn").instantiate() as Node2D 
		smoke.global_position = global_position
		get_parent().add_child(smoke)
		pass

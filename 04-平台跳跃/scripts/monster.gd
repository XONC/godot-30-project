extends CharacterBody2D

@export var SPEED:float = 100.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var right_cast: RayCast2D = $RightCast

var direction:int = 1
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	animated_sprite.play("idle")
	
	
	if right_cast.is_colliding():
		direction = -direction
		animated_sprite.flip_h = !animated_sprite.flip_h
		right_cast.target_position.x = -right_cast.target_position.x
		
	
	if not is_on_floor():
		velocity.y += gravity * delta
	else:
		position.x += SPEED * direction * delta	
		
		
	
	move_and_slide()
	pass
